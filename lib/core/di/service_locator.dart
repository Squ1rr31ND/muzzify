import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../network/api_client.dart';
import '../network/dio_client.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<Dio>(() {
    return DioClient().dio;
  });

  locator.registerLazySingleton<ApiClient>(() {
    return ApiClient(dio: locator());
  });
}
