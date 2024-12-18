import 'package:flutter_boilerplate/src/core/types/exception_type.dart';

import 'base_exception.dart';

class SnackBarException extends BaseException {
  SnackBarException(int code, String message)
      : super(code, message, ExceptionType.snack);
}
