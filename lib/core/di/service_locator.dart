import '../../features/album/di/album_di.dart';
import '../../features/auth/di/auth_di.dart';
import '../../features/track/di/track_di.dart';
import 'core_di.dart';

void setupLocator() {
  registerCoreDependencies();
  registerAuthDependencies();
  registerTrackDependencies();
  registerAlbumDependencies();
}
