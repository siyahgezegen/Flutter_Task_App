import 'package:flutter/material.dart';
import 'package:flutter_task_app/model/task_model_provider.dart';
import 'package:flutter_task_app/model/taskmodel.dart';
import 'package:flutter_task_app/view/task/task.dart';

abstract class TaskPageViewModel extends State<TaskPage> {
  late TaskProvider taskProvider;
  bool selected = false;
  List<TaskModel> taskModelList = [];
  String message = 'Data is waiting';
  @override
  void initState() {
    super.initState();
    taskProvider = TaskProvider();
    taskProvider.open();
    modelList();
  }

  modelList() async {
    var list = await taskProvider.getList();
    if (list.isNotEmpty) {
      message = 'Your data is coming, please wait..';
    } else {
      message =
          'No data found, click on the New Task button to add a new task.';
    }
    setState(() {
      taskModelList = list;
    });
  }

  deleteItem(int id) async {
    bool isdeleted = await taskProvider.deleteItem(id);
    if (isdeleted) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("is deleted"),
      ));
    }
    setState(() {});
  }
}
