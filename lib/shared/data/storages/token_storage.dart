abstract interface class TokenStorage {
  Future<bool> hasToken();

  Future<void> saveToken(String token);
  Future<String?> readToken();
  Future<void> deleteToken();
}
