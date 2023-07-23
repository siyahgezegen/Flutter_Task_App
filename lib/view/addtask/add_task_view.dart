import 'package:flutter/material.dart';
import 'package:flutter_task_app/feature/my_widgets.dart/custom_alert.dart';
import 'package:flutter_task_app/view/task.dart/task.dart';
import 'add_task_view_model.dart';

class TaskModeclslView extends TaskModelclsViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context),
      floatingActionButton: FloatingActionButton(onPressed: () {}),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: TextField(
                maxLength: 20,
                controller: txtControllerHeader,
                cursorColor: Colors.black,
                onChanged: (value) =>
                    model.header = value, //? değerler modele gidiyor..
                decoration: const InputDecoration(
                  hintText: 'Header',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: TextField(
                maxLength: 300,
                maxLines: 4,
                controller: txtControllerContent,
                cursorColor: Colors.black,
                onChanged: (value) =>
                    model.content = value, //? değerler modele gidiyor..
                decoration: const InputDecoration(
                  hintText: 'Content',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            OutlinedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red),
                ),
                onPressed: () {
                  saveModel();
                  Navigator.pop(context,
                    MaterialPageRoute(builder: (context) => const TaskPage()));
                },
                child: const Text(
                  'Save Task',
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
      ),
    );
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
