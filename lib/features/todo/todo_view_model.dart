import 'package:flutter/material.dart';

class TodoViewModel extends ChangeNotifier {
  int counter = 0;

  void increment() {
    counter ++;
    notifyListeners();
  }
}