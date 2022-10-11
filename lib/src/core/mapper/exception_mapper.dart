import 'package:flutter_clean_architecture/src/core/base/base_exception_mapper.dart';
import 'package:flutter_clean_architecture/src/core/error_handles/app_error.dart';
import 'package:flutter_clean_architecture/src/core/error_handles/base_exception.dart';
import 'package:flutter_clean_architecture/src/core/error_handles/inline_exception.dart';
import 'package:flutter_clean_architecture/src/core/error_handles/on_page_exception.dart';
import 'package:flutter_clean_architecture/src/core/error_handles/redirect_exception.dart';
import 'package:flutter_clean_architecture/src/core/error_handles/toast_exception.dart';
import 'package:flutter_clean_architecture/src/core/mapper/resource_mapper.dart';
import 'package:flutter_clean_architecture/src/core/models/models.dart';
import 'package:flutter_clean_architecture/src/core/models/tag.dart';
import 'package:flutter_clean_architecture/src/core/types/redirect_type.dart';

//TODO: Should use it in Implement of RepositoryIml(in Data)
class ExceptionMapper extends BaseExceptionMapper<AppError, BaseException> {
  final String _languageCode;
  final ResourceMapper _resourceMapper = ResourceMapper();
  ExceptionMapper({required String languageCode})
      : _languageCode = languageCode;

  @override
  Future<AppError> mapperFrom(BaseException exception) =>
      throw UnimplementedError();

  @override
  Future<BaseException> mapperTo(AppError error) async {
    final resource = await _resourceMapper.mapperTo(_languageCode);
    switch (error.type) {
      case AppErrorType.network:
        return ToastException(-1, resource.errorInternetConnection);

      case AppErrorType.server:
        if (error.errors?.length == 1) {
          return await _mapperFromSingleError(error.errors!.first);
        } else if ((error.errors?.length ?? 0) > 1) {
          return await _mapperFromMultipleErrors(error.errors!);
        } else {
          return ToastException(-1, error.message);
        }

      case AppErrorType
          .unauthorized: // After refresh token but still un authorized
        return RedirectException(
          -1,
          error.message,
          redirect: RedirectType.openLoginScreen,
          data: null,
        );

      case AppErrorType.unknown:
      case AppErrorType.cancel:
      case AppErrorType.timeout:
      default:
        return ToastException(-1, error.message);
    }
  }

  Future<BaseException> _mapperFromSingleError(
      ErrorDataModel errorDataModel) async {
    switch (errorDataModel.errorCode) {
      case 1000:
      default:
        return OnPageException(
            errorDataModel.errorCode!, errorDataModel.message!);
    }
  }

  // Multiple exception only with inline exception so need return only type inline
  Future<BaseException> _mapperFromMultipleErrors(
      List<ErrorDataModel> errors) async {
    final tagList = await _mapperFromErrors(errors);
    return InlineException(
        -1, 'multiple errors will appear to check multiple fields',
        tags: tagList);
  }

  Future<List<Tag>> _mapperFromErrors(List<ErrorDataModel> errors) async {
    final tags = <Tag>[];
    for (var error in errors) {
      tags.add(Tag(error.errorCode!.toString(), message: error.message));
    }

    return tags;
  }
}
