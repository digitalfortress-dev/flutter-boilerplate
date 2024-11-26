import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/generated/l10n/res.dart';

extension BuildContextExt on BuildContext {
  Resource res() => Resource.of(this);
}
