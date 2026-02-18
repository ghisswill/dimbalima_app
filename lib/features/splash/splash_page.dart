import 'package:dimbalima_app/core/storage/token_storage.dart';
import 'package:dimbalima_app/features/auth/page/login_page.dart';
import 'package:dimbalima_app/features/home/home_page.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _checkLogin();
  }

  Future<void> _checkLogin() async {
    // Simule une vérification d'authentification
    await Future.delayed(const Duration(seconds: 1));
    // Après la vérification, navigue vers la page d'accueil ou de connexion
    final isValid = await TokenStorage.isAccessTokenValid();
    if (!mounted) return;
    // Vérifie que le widget est toujours monté avant de naviguer
    if (isValid) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomePage()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const LoginPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
