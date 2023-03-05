import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mme_notes_app/utils/colours.dart';

pickImage(ImageSource source) async {
  final ImagePicker imagePicker = ImagePicker();
  XFile? file = await imagePicker.pickImage(source: source,imageQuality: 70);

  if (file != null) {
    return await file.readAsBytes();
  }
  //print("No image selected");
}

showSnackBar(String content, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(content),
      backgroundColor: black,
    ),
  );
}