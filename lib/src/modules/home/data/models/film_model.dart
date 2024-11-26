import 'package:equatable/equatable.dart';
import 'package:flutter_boilerplate/src/core/base/data_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'film_model.g.dart';

@JsonSerializable(explicitToJson: true)
class FilmModel extends Equatable with DataModel {
  @JsonKey(name: 'mal_id')
  final int malId;

  final String url;

  @JsonKey(name: 'images')
  final ImageModel images;

  @JsonKey(name: 'trailer')
  final TrailerModel? trailer;

  final bool approved;

  final String title;

  @JsonKey(name: 'title_english')
  final String? titleEnglish;

  @JsonKey(name: 'title_japanese')
  final String? titleJapanese;

  @JsonKey(name: 'title_synonyms')
  final List<String> titleSynonyms;

  final String type;

  final String status;

  final String? synopsis;

  final String? background;

  final String? season;

  final int? year;

  @JsonKey(name: 'broadcast')
  final BroadcastModel? broadcast;

  final List<ProducerModel> producers;

  final List<ProducerModel> licensors;

  final List<ProducerModel> studios;

  final List<GenreModel> genres;

  @JsonKey(name: 'explicit_genres')
  final List<GenreModel> explicitGenres;

  final List<GenreModel> themes;

  final List<GenreModel> demographics;

  FilmModel({
    required this.malId,
    required this.url,
    required this.images,
    this.trailer,
    required this.approved,
    required this.title,
    this.titleEnglish,
    this.titleJapanese,
    required this.titleSynonyms,
    required this.type,
    required this.status,
    this.background,
    this.synopsis,
    this.season,
    this.year,
    this.broadcast,
    required this.producers,
    required this.licensors,
    required this.studios,
    required this.genres,
    required this.explicitGenres,
    required this.themes,
    required this.demographics,
  });

  factory FilmModel.fromJson(Map<String, dynamic> json) =>
      _$FilmModelFromJson(json);

  Map<String, dynamic> toJson() => _$FilmModelToJson(this);

  @override
  List<Object?> get props => [malId];
}

@JsonSerializable()
class ImageModel {
  final ImageFormatModel jpg;
  final ImageFormatModel? webp;

  ImageModel({required this.jpg, this.webp});

  factory ImageModel.fromJson(Map<String, dynamic> json) =>
      _$ImageModelFromJson(json);

  Map<String, dynamic> toJson() => _$ImageModelToJson(this);
}

@JsonSerializable()
class ImageFormatModel {
  @JsonKey(name: 'image_url')
  final String imageUrl;

  @JsonKey(name: 'small_image_url')
  final String smallImageUrl;

  @JsonKey(name: 'large_image_url')
  final String largeImageUrl;

  ImageFormatModel({
    required this.imageUrl,
    required this.smallImageUrl,
    required this.largeImageUrl,
  });

  factory ImageFormatModel.fromJson(Map<String, dynamic> json) =>
      _$ImageFormatModelFromJson(json);

  Map<String, dynamic> toJson() => _$ImageFormatModelToJson(this);
}

@JsonSerializable()
class TrailerModel {
  @JsonKey(name: 'youtube_id')
  final String? youtubeId;

  final String? url;

  @JsonKey(name: 'embed_url')
  final String? embedUrl;

  TrailerModel({
    this.youtubeId,
    this.url,
    this.embedUrl,
  });

  factory TrailerModel.fromJson(Map<String, dynamic> json) =>
      _$TrailerModelFromJson(json);

  Map<String, dynamic> toJson() => _$TrailerModelToJson(this);
}

@JsonSerializable()
class BroadcastModel {
  final String? day;
  final String? time;
  final String? timezone;
  final String? string;

  BroadcastModel({
    this.day,
    this.time,
    this.timezone,
    this.string,
  });

  factory BroadcastModel.fromJson(Map<String, dynamic> json) =>
      _$BroadcastModelFromJson(json);

  Map<String, dynamic> toJson() => _$BroadcastModelToJson(this);
}

@JsonSerializable()
class ProducerModel {
  @JsonKey(name: 'mal_id')
  final int malId;

  final String type;

  final String name;

  final String url;

  ProducerModel({
    required this.malId,
    required this.type,
    required this.name,
    required this.url,
  });

  factory ProducerModel.fromJson(Map<String, dynamic> json) =>
      _$ProducerModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProducerModelToJson(this);
}

@JsonSerializable()
class GenreModel {
  @JsonKey(name: 'mal_id')
  final int malId;

  final String type;

  final String name;

  final String url;

  GenreModel({
    required this.malId,
    required this.type,
    required this.name,
    required this.url,
  });

  factory GenreModel.fromJson(Map<String, dynamic> json) =>
      _$GenreModelFromJson(json);

  Map<String, dynamic> toJson() => _$GenreModelToJson(this);
}
