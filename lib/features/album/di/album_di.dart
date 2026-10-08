import 'package:dio/dio.dart';

import '../../../core/di/locator.dart';
import '../data/api/album_api.dart';

void registerAlbumDependencies() {
  locator.registerLazySingleton<AlbumApi>(() => AlbumApi(dio: locator<Dio>()));
}
