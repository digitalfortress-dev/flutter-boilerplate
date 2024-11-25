import 'package:equatable/equatable.dart';
import 'package:flutter_clean_architecture/src/core/base/data_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'film_model.g.dart';

@JsonSerializable()
class FilmModel extends Equatable with DataModel {
  final String? id;
  final String? title;

  @JsonKey(name: 'original_title')
  final String? originalTitle;

  @JsonKey(name: 'original_title_romanised')
  final String? originalTitleRomanised;
  final String? image;

  @JsonKey(name: 'movie_banner')
  final String? movieBanner;
  final String? description;
  final String? director;
  final String? producer;

  @JsonKey(name: 'release_date')
  final String? releaseDate;

  @JsonKey(name: 'running_time')
  final String? runningTime;

  FilmModel(
      {this.id,
      this.title,
      this.originalTitle,
      this.originalTitleRomanised,
      this.image,
      this.movieBanner,
      this.description,
      this.director,
      this.producer,
      this.releaseDate,
      this.runningTime});

  factory FilmModel.fromJson(Map<String, dynamic> json) =>
      _$FilmModelFromJson(json);
  Map<String, dynamic> toJson() => _$FilmModelToJson(this);
  @override
  List<Object?> get props => [id];
}
