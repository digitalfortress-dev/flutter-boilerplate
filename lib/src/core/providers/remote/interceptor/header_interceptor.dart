import 'package:dio/dio.dart';
import 'package:flutter_boilerplate/src/core/providers/local/app_storage.dart';

class HeaderInterceptor extends InterceptorsWrapper {
  final String authHeaderKey = 'Authorization';
  final String bearer = 'Bearer';

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await AppStorage.use().prefHelper.getToken();
    if (token?.isNotEmpty == true) {
      options.headers[authHeaderKey] = '$bearer $token';
    }

    handler.next(options);
  }
}
