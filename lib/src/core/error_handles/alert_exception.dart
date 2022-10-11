import 'package:flutter_clean_architecture/src/core/types/exception_type.dart';

import 'base_exception.dart';

class AlertException extends BaseException {
  String? title;
  AlertException(int code, String message, {this.title})
      : super(code, message, ExceptionType.alert);
}
