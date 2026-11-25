import '../../../core/di/service_locator.dart';
import '../data/api/track_api.dart';
import '../data/repositories/track_repository_impl.dart';
import '../domain/repositories/track_repository.dart';

void setupTrackDependencies() {
  locator.registerLazySingleton<TrackApi>(() => TrackApi(dio: locator()));
  locator.registerLazySingleton<TrackRepository>(
    () => TrackRepositoryImpl(api: locator()),
  );
}
