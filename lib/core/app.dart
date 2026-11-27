import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';

import '../features/auth/presentation/bloc/auth_cubit.dart';
import 'constants/app_constants.dart';
import 'di/service_locator.dart';
import 'router/app_router.dart';
import 'theme/app_theme.dart';

class MuzzifyApp extends StatelessWidget {
  const MuzzifyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => locator<AuthCubit>()..init(),
      child: MaterialApp.router(
        title: AppConstants.appName,
        theme: AppTheme.theme,
        darkTheme: AppTheme.darkTheme,
        themeMode: AppTheme.themeMode,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
