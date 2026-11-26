abstract interface class AuthRepository {
  Future<bool> isLoggedIn();

  Future<void> loginWithCallbackUrl(String url);
  Future<void> logout();
}
