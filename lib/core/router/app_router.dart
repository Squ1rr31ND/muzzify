import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/search/domain/repositories/search_repository.dart';
import '../../features/search/presentation/bloc/search_cubit.dart';
import '../../features/search/presentation/search_screen.dart';
import '../di/service_locator.dart';
import 'app_routes.dart';

abstract final class AppRouter {
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: AppRoutes.search,
        builder: (context, _) => BlocProvider(
          create: (_) => SearchCubit(repository: locator<SearchRepository>()),
          child: const SearchScreen(),
        ),
      ),
    ],
    initialLocation: AppRoutes.search,
  );
}
