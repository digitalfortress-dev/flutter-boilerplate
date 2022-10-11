import 'package:dio/dio.dart';
import 'package:flutter_clean_architecture/src/core/providers/remote/builder/dio_builder.dart';
import 'package:injectable/injectable.dart';

@module
abstract class ProvidersModule {
  Dio get dio => DioBuilder.getInstance();
}
