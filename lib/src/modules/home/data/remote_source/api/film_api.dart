import 'package:dio/dio.dart';
import 'package:flutter_clean_architecture/src/modules/home/data/models/film_model.dart';
import 'package:retrofit/retrofit.dart';

part 'film_api.g.dart';

@RestApi()
abstract class FilmAPI {
  factory FilmAPI(Dio dioBuilder) = _FilmAPI;

  @GET('/films')
  Future<List<FilmModel>> fetchFilms();
}
