import 'package:flutter/material.dart';
import '../service/auth_service.dart';

class AuthViewModel extends ChangeNotifier {

  final AuthService _authService = AuthService();

  bool _isLoading = false;
  String? _error;

  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> login(String username, String password) async {

    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      await _authService.login(username, password);
    } catch (e) {
      _error = "Invalid credentials";
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> logout() async {
    await _authService.logout();
    notifyListeners();
  }
}
