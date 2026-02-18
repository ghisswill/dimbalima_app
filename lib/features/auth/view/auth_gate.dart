import 'package:dimbalima_app/core/storage/token_storage.dart';
import 'package:dimbalima_app/features/auth/page/login_page.dart';
import 'package:dimbalima_app/features/auth/service/auth_service.dart';
import 'package:dimbalima_app/features/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class AuthGate extends StatefulWidget {
  const AuthGate({super.key});

  @override
  State<AuthGate> createState() => _AuthGateState();
}

class _AuthGateState extends State<AuthGate> {
late Future<bool> _authCheck;

  @override
  void initState() {
    super.initState();
    _authCheck = _checkAuth();
  }

  Future<bool> _checkAuth() async {

  final token = await TokenStorage.getAccessToken();
  final refreshToken = await TokenStorage.getRefreshToken();

  if (token == null || refreshToken == null) return false;

  if (!JwtDecoder.isExpired(token)) {
    return true;
  }

  // 🔥 Tentative refresh
  try {
    await AuthService().refreshToken(refreshToken);
    return true;
  } catch (_) {
    return false;
  }
}


  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _authCheck,
      builder: (context, snapshot) {

        if (!snapshot.hasData) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        return snapshot.data!
            ? const HomePage()
            : const LoginPage();
      },
    );
  }
}