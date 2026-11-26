import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../constants/auth_constants.dart';
import 'token_storage.dart';

final class SecureTokenStorage implements TokenStorage {
  final FlutterSecureStorage _secureStorage;

  const SecureTokenStorage({required this._secureStorage});

  @override
  Future<bool> hasToken() async {
    final token = await _secureStorage.read(key: AuthConstants.accessTokenKey);
    return token != null && token.isNotEmpty;
  }

  @override
  Future<void> saveToken(String token) => _secureStorage.write(
    key: AuthConstants.accessTokenKey,
    value: token.trim(),
  );

  @override
  Future<String?> readToken() =>
      _secureStorage.read(key: AuthConstants.accessTokenKey);

  @override
  Future<void> deleteToken() =>
      _secureStorage.delete(key: AuthConstants.accessTokenKey);
}
