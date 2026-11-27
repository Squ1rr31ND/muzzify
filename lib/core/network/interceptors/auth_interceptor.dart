import 'dart:io';

import 'package:dio/dio.dart';

import '../../storages/token_storage.dart';

final class AuthInterceptor extends Interceptor {
  final TokenStorage _tokenStorage;

  const AuthInterceptor({required this._tokenStorage});

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    try {
      final token = await _tokenStorage.readToken();
      if (token != null) {
        options.headers[HttpHeaders.authorizationHeader] = 'OAuth $token';
      }
    } finally {
      handler.next(options);
    }
  }
}
