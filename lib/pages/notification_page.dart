import 'package:flutter/material.dart';
import 'package:mme_notes_app/utils/colours.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.0,
        backgroundColor: white,
        leading: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            height: 50,
            width: 45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: offWhite,
            ),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                size: 25,
                color: blue,
              ),
            ),
          ),
        ),
      ),
      body: Center(child: Text("Notification Page"),),
    );
  }
}