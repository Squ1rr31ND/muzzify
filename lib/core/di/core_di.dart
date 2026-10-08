import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../network/dio_client.dart';
import '../network/interceptors/auth_interceptor.dart';
import '../storage/secure_token_storage.dart';
import '../storage/token_storage.dart';
import 'locator.dart';

void registerCoreDependencies() {
  locator.registerLazySingleton<FlutterSecureStorage>(
    () => const FlutterSecureStorage(),
  );

  locator.registerLazySingleton<TokenStorage>(
    () => SecureTokenStorage(secureStorage: locator<FlutterSecureStorage>()),
  );

  locator.registerLazySingleton<AuthInterceptor>(
    () => AuthInterceptor(tokenStorage: locator<TokenStorage>()),
  );

  locator.registerLazySingleton<Dio>(
    () => DioClient(interceptors: [locator<AuthInterceptor>()]).dio,
  );
}
