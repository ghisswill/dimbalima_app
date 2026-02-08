import 'package:dimbalima_app/features/auth/service/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthViewModel extends ChangeNotifier {
  final AuthService _authService = AuthService();

  bool isLoading = false;
  String? error;

  Future<void> login(String username, String password) async {
    isLoading = true;
    error = null;
    notifyListeners();
    try {
      final response = await _authService.login(username, password);
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', response.token);
    } catch (e) {
      error = 'Identifiants incorrects';
    } 
    isLoading = false;
    notifyListeners();
  }
}