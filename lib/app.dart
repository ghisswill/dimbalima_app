import 'package:dimbalima_app/features/home/home_page.dart';
import 'package:dimbalima_app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lighTheme,
      home: const HomePage(),
    );
  }
}