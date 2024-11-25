// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_boilerplate/src/core/providers/providers_module.dart'
    as _i161;
import 'package:flutter_boilerplate/src/modules/home/data/repository_implementations/film_repository_impl.dart'
    as _i320;
import 'package:flutter_boilerplate/src/modules/home/domain/repositories/film_repository.dart'
    as _i219;
import 'package:flutter_boilerplate/src/modules/home/domain/usecases/film_usecases.dart'
    as _i965;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final providersModule = _$ProvidersModule();
    gh.factory<_i361.Dio>(() => providersModule.dio);
    gh.factory<_i219.FilmRepository>(() => _i320.FilmRepositoryImpl());
    gh.factory<_i965.FetchFilmUseCase>(
        () => _i965.FetchFilmUseCase(gh<_i219.FilmRepository>()));
    return this;
  }
}

class _$ProvidersModule extends _i161.ProvidersModule {}
