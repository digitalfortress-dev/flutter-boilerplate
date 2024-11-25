// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'film_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FilmResponse _$FilmResponseFromJson(Map<String, dynamic> json) => FilmResponse(
      films: (json['films'] as List<dynamic>?)
          ?.map((e) => FilmModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FilmResponseToJson(FilmResponse instance) =>
    <String, dynamic>{
      'films': instance.films,
    };
