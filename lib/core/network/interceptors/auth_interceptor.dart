import 'package:dio/dio.dart';

import '../../storage/token_storage.dart';

class AuthInterceptor extends Interceptor {
  final TokenStorage _tokenStorage;

  const AuthInterceptor({required this._tokenStorage});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    _tokenStorage
        .getAccessToken()
        .then((token) {
          if (token != null && token.isNotEmpty) {
            options.headers['Authorization'] = 'OAuth $token';
          }
        })
        .whenComplete(() {
          handler.next(options);
        });
  }
}
