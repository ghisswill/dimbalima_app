import 'package:dimbalima_app/features/auth/page/login_page.dart';
import 'package:dimbalima_app/features/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  Future<bool> hasToken() async {
    final perfs = await SharedPreferences.getInstance();
    return perfs.getString('jwt') != null;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: hasToken(),
      builder: (context, snapshot) {

        if(!snapshot.hasData) {
          return const Scaffold(body: Center(child: CircularProgressIndicator()));
        }
        if(snapshot.data == true) {
          return const HomePage();
        } else {
          return LoginPage();
        }
      },
    );
  }
}