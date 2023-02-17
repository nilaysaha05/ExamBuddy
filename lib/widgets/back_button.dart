import 'package:flutter/material.dart';
import 'package:mme_notes_app/colours.dart';

class BackButton extends StatelessWidget {
  const BackButton({Key? key, required this.onPressed,}) : super(key: key);

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding:
          const EdgeInsets.only(top: 8.0, bottom: 5.0),
          child: Container(
            height: 50,
            width: 45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.black,
            ),
            child: IconButton(
              onPressed: (){
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
      ],
    );
  }
}
