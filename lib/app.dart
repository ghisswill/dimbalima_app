import 'package:dimbalima_app/features/auth/page/auth_gate.dart';
import 'package:dimbalima_app/features/auth/viewmodel/auth_view_model.dart';
import 'package:dimbalima_app/features/home/home_page.dart';
import 'package:dimbalima_app/core/theme/app_theme.dart';
import 'package:dimbalima_app/features/todo/todo_remote_view_model.dart';
import 'package:dimbalima_app/features/todo/todo_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TodoViewModel()),
        ChangeNotifierProvider(create: (_) => TodoRemoteViewModel()),
        ChangeNotifierProvider(create: (_)=> AuthViewModel())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lighTheme,
        home: const AuthGate(),
      ),
    );
  }
}
