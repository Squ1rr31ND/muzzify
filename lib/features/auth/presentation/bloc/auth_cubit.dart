import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/repositories/auth_repository.dart';
import 'auth_state.dart';

final class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _repository;

  AuthCubit({required this._repository}) : super(AuthState.initial);

  Future<void> init() async {
    try {
      final isLoggedIn = await _repository.isLoggedIn();
      if (isLoggedIn) emit(AuthState.success);
    } catch (_) {
      emit(AuthState.initial);
    }
  }

  Future<void> loginWithCallbackUrl(String url) async {
    try {
      await _repository.loginWithCallbackUrl(url);
      emit(AuthState.success);
    } catch (_) {
      emit(AuthState.initial);
    }
  }

  Future<void> logout() async {
    try {
      await _repository.logout();
    } finally {
      emit(AuthState.initial);
    }
  }
}
