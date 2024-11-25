import 'package:flutter_boilerplate/src/modules/home/data/models/film_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'film_response.g.dart';

@JsonSerializable()
class FilmResponse {
  //TODO: some response from API with return with a json has {code, message, data }
  //TODO: please custom to suitable with response from your API
  // final int? code;
  // final int? message;
  // @JsonValue(List<FilmModel>)
  // @JsonKey(name: "", defaultValue: [])
  final List<FilmModel>? films;
  FilmResponse({this.films});

  factory FilmResponse.fromJson(Map<String, dynamic> json) =>
      _$FilmResponseFromJson(json);
}
