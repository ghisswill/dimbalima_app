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
    final controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('To DO')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(hintText: 'Nouvelle tâche'),
              onSubmitted: (value) {
                viewModel.addTodo(value);
                controller.clear();
              },
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: viewModel.todos.length,
                itemBuilder: (_, index) {
                  final todo = viewModel.todos[index];
                  return ListTile(
                    title: Text(todo.title),
                    trailing: IconButton(
                      onPressed: () => viewModel.removeTodo(index),
                      icon: Icon(Icons.delete),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
