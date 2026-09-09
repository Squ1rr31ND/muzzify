import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

import '../../features/auth/di/auth_di.dart';
import '../network/api_client.dart';
import '../network/dio_client.dart';
import '../network/interceptors/auth_interceptor.dart';
import '../storage/secure_token_storage.dart';
import '../storage/token_storage.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<FlutterSecureStorage>(() {
    return const FlutterSecureStorage();
  });

  locator.registerLazySingleton<TokenStorage>(() {
    return SecureTokenStorage(secureStorage: locator());
  });

  locator.registerLazySingleton<AuthInterceptor>(() {
    return AuthInterceptor(tokenStorage: locator());
  });

  locator.registerLazySingleton<Dio>(() {
    return DioClient().dio;
  });

  locator.registerLazySingleton<ApiClient>(() {
    return ApiClient(dio: locator());
  });

  registerAuthDependencies();
}
