import 'package:flutter/material.dart';
import 'package:flutter_task_app/model/task_model_provider.dart';
import 'package:flutter_task_app/model/taskmodel.dart';
import 'add_task.dart';

abstract class TaskModelclsViewModel extends State<TaskModelcls> {
  late TaskProvider taskProvider;

  TaskModel model = TaskModel();

  TextEditingController txtControllerHeader = TextEditingController();
  TextEditingController txtControllerContent = TextEditingController();

  @override
  void initState() {
    super.initState();
    taskProvider = TaskProvider();
    taskProvider.open();
  }

  void saveModel() async {
    final result = await taskProvider.insertItem(model);
    txtControllerHeader.text = '';
    txtControllerContent.text = '';
    if (result) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("SAVED"),
      ));
    }
  }
}
