import 'package:flutter/material.dart';
import 'package:mme_notes_app/colours.dart';

class BackButton extends StatelessWidget {
  const BackButton({Key? key, required this.onPressed,}) : super(key: key);

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
        const EdgeInsets.only(left: 10.0, top: 8.0, bottom: 5.0),
        child: Container(
          height: 50,
          width: 45,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: offWhite,
          ),
          child: IconButton(
            onPressed: onPressed,
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              size: 25,
              color: blue,
            ),
          ),
        ),
      ),
    );
  }
}
