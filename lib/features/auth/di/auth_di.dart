import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../core/di/service_locator.dart';
import '../data/datasources/access_token_data_source.dart';

void registerAuthDependencies() {
  locator.registerLazySingleton<AccessTokenDataSource>(() {
    return AccessTokenDataSource(storage: FlutterSecureStorage());
  });
}
