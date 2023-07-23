import 'package:flutter/material.dart';
import 'package:flutter_task_app/view/task.dart/task.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor:const Color.fromARGB(255, 255, 0, 0)),
        useMaterial3: true,
      ),
      home: const TaskPage(),
    );
  }
}
