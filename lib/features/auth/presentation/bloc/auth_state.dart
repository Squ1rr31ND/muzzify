enum AuthState { initial, success }

extension AuthStateExtensions on AuthState {
  bool get isAuthenticated => this == AuthState.success;
}
