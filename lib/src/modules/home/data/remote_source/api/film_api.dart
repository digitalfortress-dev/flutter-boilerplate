import 'package:dio/dio.dart';
import 'package:flutter_boilerplate/src/modules/home/data/remote_source/response/film_response.dart';
import 'package:retrofit/retrofit.dart';

part 'film_api.g.dart';

@RestApi()
abstract class FilmAPI {
  factory FilmAPI(Dio dioBuilder) = _FilmAPI;

  @GET('/top/anime')
  Future<FilmResponse> fetchFilms();
}
