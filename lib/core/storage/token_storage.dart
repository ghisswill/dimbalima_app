import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class TokenStorage {
  static const _storage = FlutterSecureStorage();

  static Future<void> saveTokens(String accessToken, String refreshToken) async {
    await _storage.write(key: "access_token", value: accessToken);
    await _storage.write(key: "refresh_token", value: refreshToken);
  }

  static Future<String?> getAccessToken() async {
    return await _storage.read(key: "access_token");
  }

  static Future<String?> getRefreshToken() async {
    return await _storage.read(key: "refresh_token");
  }

  static Future<void> clear() async {
    await _storage.deleteAll();
  }

  static Future<bool> isAccessTokenValid() async {
    final token = await getAccessToken();
    if (token == null) return false;

    return !JwtDecoder.isExpired(token);
  }
}