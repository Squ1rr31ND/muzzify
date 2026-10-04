import 'package:go_router/go_router.dart';

import '../../features/album/ui/album_screen.dart';
import '../../features/auth/ui/auth_screen.dart';
import '../../features/search/ui/search_screen.dart';

abstract final class Navigation {
  static const String loginRoute = '/login';
  static const String searchRoute = '/search';

  static const String _albumIdParamName = 'albumId';
  static const String _albumRouteTemplate = '/album/:$_albumIdParamName';
  static String albumRoute(String albumId) => '/album/$albumId';

  static final GoRouter router = GoRouter(
    initialLocation: searchRoute,
    routes: [
      GoRoute(
        path: loginRoute,
        builder: (context, state) => const AuthScreen(),
      ),
      GoRoute(
        path: searchRoute,
        builder: (context, state) => const SearchScreen(),
      ),
      GoRoute(
        path: _albumRouteTemplate,
        builder: (context, state) {
          final String albumId = state.pathParameters[_albumIdParamName]!;
          return AlbumScreen(albumId: albumId);
        },
      ),
    ],
  );
}
