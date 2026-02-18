import 'package:dimbalima_app/core/storage/token_storage.dart';
import 'package:dimbalima_app/features/auth/data/auth_api.dart';

class AuthRepository {
  final _api = AuthApi();

  Future<void> login(String username, String password) async {
    final response = await _api.login(username, password);
    
    final accessToken = response.data['access_token'];
    final refreshToken = response.data['refresh_token'];

    await TokenStorage.saveTokens(accessToken, refreshToken);
  }
}