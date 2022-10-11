// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../modules/home/data/repository_implementations/film_repository_impl.dart'
    as _i5;
import '../../modules/home/domain/repositories/film_repository.dart' as _i4;
import '../../modules/home/domain/usecases/film_usecases.dart' as _i6;
import '../providers/providers_module.dart'
    as _i7; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final providersModule = _$ProvidersModule();
  gh.factory<_i3.Dio>(() => providersModule.dio);
  gh.factory<_i4.FilmRepository>(() => _i5.FilmRepositoryImpl());
  gh.factory<_i6.FetchFilmUseCase>(
      () => _i6.FetchFilmUseCase(get<_i4.FilmRepository>()));
  return get;
}

class _$ProvidersModule extends _i7.ProvidersModule {}
