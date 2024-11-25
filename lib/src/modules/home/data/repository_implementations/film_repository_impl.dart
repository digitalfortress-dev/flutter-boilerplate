import 'package:flutter_boilerplate/src/core/error_handles/app_error.dart';
import 'package:flutter_boilerplate/src/core/mapper/exception_mapper.dart';
import 'package:flutter_boilerplate/src/core/providers/local/app_storage.dart';
import 'package:flutter_boilerplate/src/core/providers/remote/builder/dio_builder.dart';
import 'package:flutter_boilerplate/src/modules/home/data/mappers/fiml_mapper.dart';
import 'package:flutter_boilerplate/src/modules/home/data/models/film_model.dart';
import 'package:flutter_boilerplate/src/modules/home/data/remote_source/api/film_api.dart';
import 'package:flutter_boilerplate/src/modules/home/domain/entities/film_entity.dart';
import 'package:flutter_boilerplate/src/modules/home/domain/repositories/film_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: FilmRepository)
class FilmRepositoryImpl implements FilmRepository {
  final FilmAPI filmAPI = FilmAPI(DioBuilder.getInstance());
  final ExceptionMapper _exceptionMapper = ExceptionMapper(
      languageCode: AppStorage.use().prefHelper.getLanguageCode());

  FilmRepositoryImpl();

  @override
  Future<List<FilmEntity>> fetchFilms() async {
    List<FilmModel> response = await filmAPI.fetchFilms().catchError(
        (e) async => throw await _exceptionMapper.mapperTo(AppError.from(e)));
    List<FilmEntity> mapToFilmEntity = [];
    for (var e in response) {
      mapToFilmEntity.add(
        FilmMapper().mapperTo(e),
      );
    }
    return mapToFilmEntity;
  }
}
