import 'package:flutter/material.dart';
import 'package:flutter_task_app/model/task_model_provider.dart';
import 'package:flutter_task_app/model/taskmodel.dart';
import 'package:flutter_task_app/view/task.dart/task.dart';

abstract class TaskPageViewModel extends State<TaskPage> {
  late TaskProvider taskProvider;
  bool selected = false;
  List<TaskModel> taskModelList = [];
  Future modelList() async {
    taskModelList = await taskProvider.getList();
    setState(() {});
  }

  deleteItem(int id) async {
    bool isdeleted = await taskProvider.deleteItem(id);
    if (isdeleted) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("is deleted"),
      ));
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    taskProvider = TaskProvider();
    taskProvider.open();
  }
}
