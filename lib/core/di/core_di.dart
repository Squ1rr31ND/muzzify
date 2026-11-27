import 'package:dio/dio.dart';

import '../network/dio_client.dart';
import '../network/interceptors/auth_interceptor.dart';
import 'service_locator.dart';

void setupCoreDependencies() {
  locator.registerLazySingleton<AuthInterceptor>(
    () => AuthInterceptor(tokenStorage: locator()),
  );

  locator.registerLazySingleton<Dio>(() {
    final interceptors = [locator<AuthInterceptor>()];
    return DioClient(interceptors: interceptors).dio;
  });
}
