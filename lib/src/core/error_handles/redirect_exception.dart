import 'package:flutter_clean_architecture/src/core/types/exception_type.dart';
import 'package:flutter_clean_architecture/src/core/types/redirect_type.dart';

import 'base_exception.dart';

class RedirectException extends BaseException {
  final RedirectType redirect;
  final dynamic data;

  RedirectException(
    int code,
    String message, {
    required this.redirect,
    required this.data,
  }) : super(code, message, ExceptionType.redirect);
}
