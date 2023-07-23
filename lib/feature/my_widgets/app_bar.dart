import 'package:flutter/material.dart';

import 'custom_alert.dart';

class CustomAppBar {
  static AppBar customAppBar(BuildContext context) {
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
