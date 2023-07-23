import 'package:flutter/material.dart';
import 'package:flutter_task_app/feature/my_widgets/app_bar.dart';
import 'package:flutter_task_app/view/addtask/add_task.dart';
import 'package:flutter_task_app/view/task/task_view_model.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TaskPageView extends TaskPageViewModel {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: CustomAppBar.customAppBar(context),
        body: Column(
          children: [
            Expanded(
                child: taskModelList.isEmpty
                    ? Center(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [Text(message)],
                          ),
                        ),
                      )
                    : ListView.builder(
                        itemCount: taskModelList.length,
                        itemBuilder: (context, index) {
                          return Slidable(
                            startActionPane: ActionPane(
                                // taskModelList[index].header.toString()
                                motion: const StretchMotion(),
                                children: [
                                  SlidableAction(
                                      icon: const IconData(57785,
                                          fontFamily: 'MaterialIcons'),
                                      backgroundColor: Colors.red,
                                      autoClose: true,
                                      label: 'Delete',
                                      onPressed: (context) {
                                        deleteItem(
                                            taskModelList[index].id as int);
                                        modelList();
                                      }),
                                ]),
                            child: Center(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.blue[100],
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      width: width * (9 / 10),
                                      height: height * (1 / 2),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  taskModelList[index]
                                                      .header
                                                      .toString(),
                                                  style: const TextStyle(
                                                      fontFamily: 'Roboto',
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 22),
                                                ),
                                              )
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 30,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              children: [
                                                Text(taskModelList[index]
                                                    .content
                                                    .toString())
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        })),
            const SizedBox(
              height: 100,
            )
          ],
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red),
              ),
              child: const Text(
                'New Task',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TaskModelcls()));
              },
            ),
          ],
        ));
  }
}
