/* import 'package:dimbalima_app/core/services/api_service.dart';
import 'package:flutter/material.dart';

class TodoRemoteViewModel extends ChangeNotifier{
  final ApiService _api = ApiService();

  List<String> todos = [];
  bool isLoading = false;

  Future<void> loadTodos() async {
    isLoading = true;
    notifyListeners();
    try {
      todos = await _api.fetchTodos();
    } catch (e) {
      todos = [];
    }
    isLoading = false;
    notifyListeners();
  } 
} */