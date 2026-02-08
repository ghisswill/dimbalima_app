import 'package:dimbalima_app/features/auth/viewmodel/auth_view_model.dart';
import 'package:dimbalima_app/features/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final TextEditingController usernameCtrl = TextEditingController();
  final TextEditingController passwordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<AuthViewModel>();

    return Scaffold(
      appBar: AppBar(title: const Text('Login ')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: usernameCtrl,
              decoration: const InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: passwordCtrl,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 16),
            if(vm.isLoading) const CircularProgressIndicator(),
            if(vm.error != null) Text(vm.error!, style: const TextStyle(color: Colors.red))
            else ElevatedButton(
              onPressed: () async {
                await vm.login(usernameCtrl.text, passwordCtrl.text);
                if(vm.error == null) {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const HomePage()));
                }
              },
              child: const Text('se connecter'),
            )
          ],
        ),
      ),
    );
  }
}
