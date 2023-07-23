import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomAlert {
  Future<void> showMyDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Application and me'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                const Text(
                    'The purpose of the application: To improve myself and strive to create better applications.'),
                const SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: () => launchUrl(Uri.parse('https://github.com/siyahgezegen')),
                  child: const Text(
                    'Github :  SiyahGezegen',
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.blue),
                  ),
                )
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
