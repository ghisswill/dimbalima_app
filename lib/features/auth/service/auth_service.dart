import 'package:dimbalima_app/features/auth/model/auth_response.dart';
import 'package:http/http.dart' as http;

class AuthService {
  static const baseUrl = 'https://10.0.2.2:8080';

  Future<AuthResponse> login(String username, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      headers: {'Content-Type': 'application/json'},
      body: {'username': username, 'password': password},
    );
    if (response.statusCode == 200) {
      return AuthResponse.fromJson(response.body as Map<String, dynamic>);
    } else {
      throw Exception('Failed to login');
    }
  }
}