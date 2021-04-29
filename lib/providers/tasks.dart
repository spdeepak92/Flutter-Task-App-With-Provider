import 'package:flutter/material.dart';

class Tasks extends ChangeNotifier {
  final List _tasks = [];

  List get getTasks {
    return [..._tasks];
  }

  int totalTasksCount({filter = 'TOTAL'}) {
    if (filter != 'TOTAL') {
      int total = 0;
      _tasks.map((e) {
        if (e['status'] == filter) {
          total = total + 1;
        }
      }).toList();
      return total;
    } else {
      return _tasks.length;
    }
  }

  void addTask(task) {
    _tasks.add(task);
    notifyListeners();
  }

  void deleteTask(task) {
    _tasks.remove(task);
    notifyListeners();
  }
}
