import '../../../../core/storages/token_storage.dart';
import '../../domain/repositories/auth_repository.dart';
import '../parsers/callback_url_parser.dart';
import '../storages/cookie_storage.dart';

final class AuthRepositoryImpl implements AuthRepository {
  final CookieStorage _cookieStorage;
  final TokenStorage _tokenStorage;

  const AuthRepositoryImpl({
    required this._cookieStorage,
    required this._tokenStorage,
  });

  @override
  Future<bool> isLoggedIn() => _tokenStorage.hasToken();

  @override
  Future<void> loginWithCallbackUrl(String url) {
    final token = CallbackUrlParser.extractToken(url);
    return _tokenStorage.saveToken(token);
  }

  @override
  Future<void> logout() async {
    await _cookieStorage.clearCookies();
    await _tokenStorage.deleteToken();
  }
}
