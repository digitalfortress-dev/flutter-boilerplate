import 'package:flutter_clean_architecture/src/modules/home/domain/entities/film_entity.dart';
import 'package:injectable/injectable.dart';

@factoryMethod
abstract class FilmRepository {
  @preResolve
  Future<List<FilmEntity>> fetchFilms();
}
