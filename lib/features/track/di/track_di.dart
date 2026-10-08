import 'package:dio/dio.dart';

import '../../../core/di/locator.dart';
import '../data/api/track_api.dart';

void registerTrackDependencies() {
  locator.registerLazySingleton<TrackApi>(() => TrackApi(dio: locator<Dio>()));
}
