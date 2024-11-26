import 'package:flutter_boilerplate/src/core/base/model_item_mapper.dart';
import 'package:flutter_boilerplate/src/modules/home/data/models/models.dart';
import 'package:flutter_boilerplate/src/modules/home/domain/entities/film_entity.dart';

class FilmMapper extends ModelToEntityMapper<FilmModel, FilmEntity> {
  @override
  FilmEntity mapperTo(FilmModel data) {
    return FilmEntity(
      malId: data.malId,
      url: data.url,
      imageUrl: data.images.jpg.imageUrl,
      youtubeId: data.trailer?.youtubeId,
      approved: data.approved,
      title: data.title,
      titleEnglish: data.titleEnglish,
      titleJapanese: data.titleJapanese,
      titleSynonyms: data.titleSynonyms,
      type: data.type,
      status: data.status,
      synopsis: data.synopsis,
      background: data.background,
      season: data.season,
      year: data.year,
      broadcast: data.broadcast != null
          ? BroadcastEntity(
              day: data.broadcast!.day,
              time: data.broadcast!.time,
              timezone: data.broadcast!.timezone,
              string: data.broadcast!.string,
            )
          : null,
      producers: data.producers
          .map((producer) => ProducerEntity(
                malId: producer.malId,
                type: producer.type,
                name: producer.name,
                url: producer.url,
              ))
          .toList(),
      licensors: data.licensors
          .map((licensor) => ProducerEntity(
                malId: licensor.malId,
                type: licensor.type,
                name: licensor.name,
                url: licensor.url,
              ))
          .toList(),
      studios: data.studios
          .map((studio) => ProducerEntity(
                malId: studio.malId,
                type: studio.type,
                name: studio.name,
                url: studio.url,
              ))
          .toList(),
      genres: data.genres
          .map((genre) => GenreEntity(
                malId: genre.malId,
                type: genre.type,
                name: genre.name,
                url: genre.url,
              ))
          .toList(),
      explicitGenres: data.explicitGenres
          .map((genre) => GenreEntity(
                malId: genre.malId,
                type: genre.type,
                name: genre.name,
                url: genre.url,
              ))
          .toList(),
      themes: data.themes
          .map((theme) => GenreEntity(
                malId: theme.malId,
                type: theme.type,
                name: theme.name,
                url: theme.url,
              ))
          .toList(),
      demographics: data.demographics
          .map((demographic) => GenreEntity(
                malId: demographic.malId,
                type: demographic.type,
                name: demographic.name,
                url: demographic.url,
              ))
          .toList(),
    );
  }
}
