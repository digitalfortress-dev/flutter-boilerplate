import 'package:flutter_clean_architecture/src/core/models/tag.dart';
import 'package:flutter_clean_architecture/src/core/types/exception_type.dart';

import 'base_exception.dart';

class InlineException extends BaseException {
  final List<Tag> tags;

  InlineException(int code, String message, {required this.tags})
      : super(code, message, ExceptionType.inline);
}
