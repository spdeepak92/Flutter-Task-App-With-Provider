import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_app/pages/home_task.dart';
import 'package:task_app/providers/tasks.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Tasks(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'TASKS',
        home: Home(),
      ),
    );
  }
}
