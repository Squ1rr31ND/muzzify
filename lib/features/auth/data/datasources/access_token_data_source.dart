import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AccessTokenDataSource {
  static const String key = 'access_token';

  final FlutterSecureStorage storage;

  const AccessTokenDataSource({required this.storage});

  Future<String?> get() {
    return storage.read(key: key);
  }

  Future<void> save(String token) {
    return storage.write(key: key, value: token);
  }

  Future<void> delete() {
    return storage.delete(key: key);
  }
}
