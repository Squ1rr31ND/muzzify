import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../features/auth/presentation/bloc/auth_cubit.dart';
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
        title: 'Muzzify',
        theme: AppTheme.theme,
        darkTheme: AppTheme.darkTheme,
        themeMode: AppTheme.themeMode,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
