// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:flutter_clean_architecture/src/modules/home/data/repository_implementations/film_repository_impl.dart'
    as _i5;
import 'package:flutter_clean_architecture/src/modules/home/domain/repositories/film_repository.dart'
    as _i4;
import 'package:flutter_clean_architecture/src/modules/home/domain/usecases/film_usecases.dart'
    as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../providers/providers_module.dart' as _i7;

/// ignore_for_file: unnecessary_lambdas
/// ignore_for_file: lines_longer_than_80_chars
extension GetItInjectableX on _i1.GetIt {
  /// initializes the registration of main-scope dependencies inside of [GetIt]
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final providersModule = _$ProvidersModule();
    gh.factory<_i3.Dio>(() => providersModule.dio);
    gh.factory<_i4.FilmRepository>(() => _i5.FilmRepositoryImpl());
    gh.factory<_i6.FetchFilmUseCase>(
        () => _i6.FetchFilmUseCase(gh<_i4.FilmRepository>()));
    return this;
  }
}

class _$ProvidersModule extends _i7.ProvidersModule {}
