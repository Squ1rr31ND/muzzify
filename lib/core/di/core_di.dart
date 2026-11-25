import 'package:dio/dio.dart';

import '../network/dio_client.dart';
import 'service_locator.dart';

void setupCoreDependencies() {
  locator.registerLazySingleton<Dio>(() => DioClient().dio);
}
