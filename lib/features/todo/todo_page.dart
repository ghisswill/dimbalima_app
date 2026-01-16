import 'package:dimbalima_app/features/todo/todo_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TodoViewModel(),
      child: const _TodoView(),
    );
  }
}

class _TodoView extends StatelessWidget {
  const _TodoView();

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<TodoViewModel>();

    return Scaffold(
      appBar: AppBar(title: const Text('To DO')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'counter: ${viewModel.counter}',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: viewModel.increment,
              child: const Text('Increment'),
            ),
          ],
        ),
      ),
    );
  }
}
