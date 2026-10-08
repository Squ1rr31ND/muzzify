import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../features/album/di/album_di.dart';
import '../../features/auth/di/auth_di.dart';
import '../../features/track/di/track_di.dart';
import '../network/dio_client.dart';
import '../network/interceptors/auth_interceptor.dart';
import '../storage/secure_token_storage.dart';
import '../storage/token_storage.dart';
import 'locator.dart';

void setupLocator() {
  _registerStorageDependencies();
  _registerNetworkDependencies();
  _registerFeatureDependencies();
}

void _registerStorageDependencies() {
  locator.registerLazySingleton<FlutterSecureStorage>(
    () => const FlutterSecureStorage(),
  );

  locator.registerLazySingleton<TokenStorage>(
    () => SecureTokenStorage(secureStorage: locator<FlutterSecureStorage>()),
  );
}

void _registerNetworkDependencies() {
  locator.registerLazySingleton<AuthInterceptor>(
    () => AuthInterceptor(tokenStorage: locator<TokenStorage>()),
  );

  locator.registerLazySingleton<Dio>(
    () => DioClient(interceptors: [locator<AuthInterceptor>()]).dio,
  );
}

void _registerFeatureDependencies() {
  registerAuthDependencies();
  registerTrackDependencies();
  registerAlbumDependencies();
}
