import '../../../core/di/service_locator.dart';
import '../data/api/search_api.dart';
import '../data/repositories/search_repository_impl.dart';
import '../domain/repositories/search_repository.dart';

void setupSearchDependencies() {
  locator.registerLazySingleton<SearchApi>(() => SearchApi(dio: locator()));
  locator.registerLazySingleton<SearchRepository>(
    () => SearchRepositoryImpl(api: locator()),
  );
}
