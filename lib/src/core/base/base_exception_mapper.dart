import 'package:flutter_clean_architecture/src/core/error_handles/app_error.dart';
import 'package:flutter_clean_architecture/src/core/error_handles/base_exception.dart';

abstract class BaseExceptionMapper<T extends AppError,
    R extends BaseException> {
  Future<R> mapperTo(T error);

  Future<T> mapperFrom(R exception);
}
