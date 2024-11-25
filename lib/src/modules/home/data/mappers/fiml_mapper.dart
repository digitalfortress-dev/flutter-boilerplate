import 'package:flutter_boilerplate/src/core/base/model_item_mapper.dart';
import 'package:flutter_boilerplate/src/modules/home/data/models/models.dart';
import 'package:flutter_boilerplate/src/modules/home/domain/entities/film_entity.dart';

class FilmMapper extends ModelToEntityMapper<FilmModel, FilmEntity> {
  @override
  FilmEntity mapperTo(FilmModel data) {
    return FilmEntity(
      title: data.title.toString(),
      originalTitle: data.originalTitle.toString(),
      originalTitleRomanised: data.originalTitleRomanised.toString(),
      description: data.description.toString(),
      director: data.director.toString(),
      producer: data.producer.toString(),
      image: data.image.toString(),
      movieBanner: data.movieBanner.toString(),
      releaseDate: data.releaseDate.toString(),
      runningTime: data.runtimeType.toString(),
    );
  }
}
