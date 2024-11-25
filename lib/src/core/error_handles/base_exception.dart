import 'package:flutter_boilerplate/src/core/types/exception_type.dart';

abstract class BaseException implements Exception {
  final int code;
  final String message;
  final ExceptionType exceptionType;

  const BaseException(this.code, this.message, this.exceptionType);
}
