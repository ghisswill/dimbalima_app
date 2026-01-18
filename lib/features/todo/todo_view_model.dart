import 'package:dimbalima_app/features/todo/todo.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TodoViewModel extends ChangeNotifier {
  static const _stockageKey = 'todo';
  final List<Todo> _todos = [];

  List<Todo> get todos => _todos;

  TodoViewModel() {
    _loadTodos();
  }

  void addTodo(String title) {
    if(title.isEmpty) return;
    _todos.add(Todo(title));
    _saveTodo();
    notifyListeners();
  }

  void removeTodo(int index) {
    _todos.removeAt(index);
    _saveTodo();
    notifyListeners();
  }

  Future<void>_saveTodo() async {
    final prefs = await SharedPreferences.getInstance();
    final titles = _todos.map((e)=> e.title).toList();
    await prefs.setStringList(_stockageKey, titles);
  }

  Future<void>_loadTodos() async {
    final perfs = await SharedPreferences.getInstance();
    final titles = perfs.getStringList(_stockageKey) ?? [];
    _todos.clear();
    _todos.addAll(titles.map((e)=>Todo(e)));
    notifyListeners();
  }
}