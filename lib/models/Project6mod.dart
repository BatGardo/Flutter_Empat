import 'package:flutter/material.dart';

class Project6Model extends ChangeNotifier {

  final List<String> _tasks = [];

  List<String> get tasks => _tasks;

  void addTask(String title) {
    _tasks.add(title);
    notifyListeners();
  }

  void removeTask(int index) {
    _tasks.removeAt(index);
    notifyListeners();
  }
}
