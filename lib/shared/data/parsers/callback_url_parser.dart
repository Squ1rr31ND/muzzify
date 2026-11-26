import '../../constants/auth_constants.dart';

abstract final class CallbackUrlParser {
  static String extractToken(String url) {
    final uri = Uri.parse(url);

    final fragment = uri.fragment.trim();

    if (fragment.isEmpty) {
      throw const FormatException('Missing fragment in callback url');
    }

    final params = Uri.splitQueryString(fragment);

    final token = params[AuthConstants.accessTokenKey]?.trim();

    if (token == null || token.isEmpty) {
      throw const FormatException(
        'Missing "${AuthConstants.accessTokenKey}" in fragment',
      );
    }

    return token;
  }
}
