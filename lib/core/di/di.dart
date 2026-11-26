import '../../features/auth/di/auth_di.dart';
import '../../features/search/di/search_di.dart';
import '../../features/track/di/track_di.dart';
import 'core_di.dart';

void setupAllDependencies() {
  setupAuthDependencies();
  setupCoreDependencies();
  setupTrackDependencies();
  setupSearchDependencies();
}
