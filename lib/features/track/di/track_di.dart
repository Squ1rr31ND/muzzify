import 'package:dio/dio.dart';

import '../../../core/di/service_locator.dart';
import '../data/api/track_api.dart';

void registerTrackDependencies() {
  locator.registerLazySingleton<TrackApi>(() {
    return TrackApi(dio: locator<Dio>());
  });
}
