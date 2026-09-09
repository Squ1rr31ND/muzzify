import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'token_storage.dart';

class SecureTokenStorage implements TokenStorage {
  static const String _accessTokenKey = 'access_token';

  final FlutterSecureStorage _secureStorage;

  const SecureTokenStorage({required this._secureStorage});

  @override
  Future<String?> getAccessToken() {
    return _secureStorage.read(key: _accessTokenKey);
  }

  @override
  Future<void> saveAccessToken(String token) async {
    await _secureStorage.write(key: _accessTokenKey, value: token);
  }

  @override
  Future<void> deleteAccessToken() async {
    await _secureStorage.delete(key: _accessTokenKey);
  }
}
