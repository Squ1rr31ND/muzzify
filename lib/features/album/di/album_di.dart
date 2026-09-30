import '../../../core/di/service_locator.dart';
import '../data/api/album_api.dart';

void registerAlbumDependencies() {
  locator.registerLazySingleton<AlbumApi>(() {
    return AlbumApi(dio: locator());
  });
}
