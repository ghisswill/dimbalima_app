import 'package:dimbalima_app/core/network/dio_client.dart';
import 'package:dio/src/response.dart';

class AuthApi {
  Future<Response> login(String username, String password) async {
    return DioClient.dio.post('/auth/login', data: {
      'username': username,
      'password': password
    });
  }
}