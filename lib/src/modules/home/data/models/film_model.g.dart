// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'film_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FilmModel _$FilmModelFromJson(Map<String, dynamic> json) => FilmModel(
      id: json['id'] as String?,
      title: json['title'] as String?,
      originalTitle: json['original_title'] as String?,
      originalTitleRomanised: json['original_title_romanised'] as String?,
      image: json['image'] as String?,
      movieBanner: json['movie_banner'] as String?,
      description: json['description'] as String?,
      director: json['director'] as String?,
      producer: json['producer'] as String?,
      releaseDate: json['release_date'] as String?,
      runningTime: json['running_time'] as String?,
    );

Map<String, dynamic> _$FilmModelToJson(FilmModel instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'original_title': instance.originalTitle,
      'original_title_romanised': instance.originalTitleRomanised,
      'image': instance.image,
      'movie_banner': instance.movieBanner,
      'description': instance.description,
      'director': instance.director,
      'producer': instance.producer,
      'release_date': instance.releaseDate,
      'running_time': instance.runningTime,
    };
