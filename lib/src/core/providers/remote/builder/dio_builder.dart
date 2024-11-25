import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_clean_architecture/src/core/config/app_config.dart';
import 'package:flutter_clean_architecture/src/core/di/locator.dart';
import 'package:flutter_clean_architecture/src/core/providers/remote/interceptor/header_interceptor.dart';

class DioBuilder extends DioMixin implements Dio {
  // create basic information for request
  final String contentType = 'application/json';
  final int connectionTimeOutMls = 30000;
  final int readTimeOutMls = 30000;
  final int writeTimeOutMls = 30000;

  static DioBuilder getInstance(
          {bool ignoredToken = false, BaseOptions? options}) =>
      DioBuilder._(ignoredToken, options);

  DioBuilder._(bool ignoredToken, [BaseOptions? options]) {
    options = BaseOptions(
      baseUrl: locator<AppConfig>().baseUrl,
      contentType: contentType,
      connectTimeout: connectionTimeOutMls,
      receiveTimeout: readTimeOutMls,
      sendTimeout: writeTimeOutMls,
    );

    this.options = options;

    // Debug mode
    if (kDebugMode) {
      interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
    }

    interceptors.add(HeaderInterceptor());

    // create default http client
    httpClientAdapter = DefaultHttpClientAdapter();
    // If you want run for web, please use httpClientAdapter from BrowserHttpClientAdapter
    // if (kIsWeb) {
    //   httpClientAdapter = BrowserHttpClientAdapter();
    // }
  }
}
