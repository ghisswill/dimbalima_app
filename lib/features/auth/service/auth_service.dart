import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthService {
  final Dio _dio = Dio(BaseOptions(baseUrl: 'http://localhost:8080'));

  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  Future<void> login(String username, String password) async {
    final response = await _dio.post("/auth/login", data: {
      'username': username,
      'password': password,
    });

    await _storage.write(key: 'access_token', value: response.data['access_token']);
    await _storage.write(key: 'refresh_token', value: response.data['refresh_token']);

  }

  Future<String?> getAccessToken() async {
    return await _storage.read(key:   'access_token');
  }

  Future<void> logout() async {
    await _storage.deleteAll();
  }

  Future<void> refreshToken(String refreshToken) async {
    final response = await _dio.post("/auth/refresh", data: {
      'refresh_token': refreshToken,
    });

    await _storage.write(key: 'access_token', value: response.data['access_token']);
    await _storage.write(key: 'refresh_token', value: response.data['refresh_token']);
  }

}