import 'package:flutter_boilerplate/src/core/usecase.dart';
import 'package:flutter_boilerplate/src/modules/home/domain/entities/film_entity.dart';
import 'package:flutter_boilerplate/src/modules/home/domain/repositories/film_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class FetchFilmUseCase extends NoParamsUseCase<List<FilmEntity>> {
  FetchFilmUseCase(this.filmRepository);

  final FilmRepository filmRepository;

  @override
  Future<List<FilmEntity>> call() async {
    return await filmRepository.fetchFilms();
  }
}
