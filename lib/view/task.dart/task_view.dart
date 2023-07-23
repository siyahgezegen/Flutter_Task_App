import 'package:flutter/material.dart';
import 'package:flutter_task_app/feature/my_widgets.dart/custom_alert.dart';
import 'package:flutter_task_app/view/addtask/add_task.dart';
import 'package:flutter_task_app/view/task.dart/task_view_model.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TaskPageView extends TaskPageViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar(context),
        body: Column(
          children: [
            Expanded(
                child: ListView.builder(
                    itemCount: taskModelList.length,
                    itemBuilder: (context, index) {
                      return Slidable(
                        startActionPane: ActionPane(
                            motion: const StretchMotion(),
                            children: [
                              SlidableAction(
                                  backgroundColor: Colors.red,
                                  label: 'Delete',
                                  onPressed: (context) {
                                    deleteItem(taskModelList[index].id as int);
                                    modelList();
                                  }),
                            ]),
                        child: ListTile(
                          title: Text(taskModelList[index].header.toString()),
                          selectedColor: Colors.red,
                          leading: const Text('data'),
                        ),
                      );
                    })),
            const SizedBox(
              height: 100,
            )
          ],
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red),
              ),
              child: const Text(
                'Get all Task',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                modelList();
              },
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red),
              ),
              child: const Text(
                'New Task',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TaskModelcls()));
              },
            ),
          ],
        ));
  }

  AppBar customAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: const Color.fromARGB(255, 255, 17, 0),
      title: const Text('Task List'),
      actions: [
        IconButton(
          onPressed: () {
            //! Alert and Github linkLink
            CustomAlert().showMyDialog(context);
          },
          icon: const Icon(Icons.info_outlined,
              color: Color.fromARGB(255, 255, 255, 255), size: 30),
        )
      ],
    );
  }
}
