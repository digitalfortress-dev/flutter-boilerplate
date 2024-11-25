import 'package:flutter_boilerplate/src/core/base/data_model.dart';
import 'package:flutter_boilerplate/src/core/models/models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'errors_response.g.dart';

@JsonSerializable(createToJson: false, checked: true)
class ErrorsResponse with DataModel {
  final List<ErrorDataModel>? errors;

  ErrorsResponse({this.errors});
  factory ErrorsResponse.fromJson(Map<String, dynamic> json) =>
      _$ErrorsResponseFromJson(json);
}
