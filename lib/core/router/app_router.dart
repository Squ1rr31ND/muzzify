import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/auth_screen.dart';
import '../../features/auth/presentation/bloc/auth_cubit.dart';
import '../../features/auth/presentation/bloc/auth_state.dart';
import '../../features/search/domain/repositories/search_repository.dart';
import '../../features/search/presentation/bloc/search_cubit.dart';
import '../../features/search/presentation/search_screen.dart';
import '../di/service_locator.dart';
import '../utils/stream_to_listenable.dart';
import 'app_routes.dart';

abstract final class AppRouter {
  static final AuthCubit _authCubit = locator<AuthCubit>();

  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(path: AppRoutes.auth, builder: (_, _) => const AuthScreen()),
      GoRoute(
        path: AppRoutes.search,
        builder: (_, _) => BlocProvider(
          create: (_) => SearchCubit(repository: locator<SearchRepository>()),
          child: const SearchScreen(),
        ),
      ),
    ],
    redirect: (context, state) {
      final target = _authCubit.state.isAuthenticated
          ? AppRoutes.search
          : AppRoutes.auth;

      return state.matchedLocation == target ? null : target;
    },
    refreshListenable: StreamToListenable(_authCubit.stream),
  );
}
