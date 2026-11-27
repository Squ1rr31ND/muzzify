import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../core/di/service_locator.dart';
import '../../../core/storages/token_storage.dart';
import '../data/repositories/auth_repository_impl.dart';
import '../data/storages/cookie_storage.dart';
import '../data/storages/cookie_storage_impl.dart';
import '../data/storages/secure_token_storage.dart';
import '../domain/repositories/auth_repository.dart';
import '../presentation/bloc/auth_cubit.dart';

void setupAuthDependencies() {
  locator.registerLazySingleton<WebViewCookieManager>(
    () => WebViewCookieManager(),
  );

  locator.registerLazySingleton<FlutterSecureStorage>(
    () => const FlutterSecureStorage(),
  );

  locator.registerLazySingleton<CookieStorage>(
    () => CookieStorageImpl(cookieManager: locator()),
  );

  locator.registerLazySingleton<TokenStorage>(
    () => SecureTokenStorage(secureStorage: locator()),
  );

  locator.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(cookieStorage: locator(), tokenStorage: locator()),
  );

  locator.registerLazySingleton<AuthCubit>(
    () => AuthCubit(repository: locator()),
  );
}
