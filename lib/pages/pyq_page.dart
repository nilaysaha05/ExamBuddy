import 'dart:io';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class PyqPage extends StatefulWidget {
  const PyqPage({Key? key}) : super(key: key);

  @override
  State<PyqPage> createState() => _PyqPageState();
}

class _PyqPageState extends State<PyqPage> {
  @override
  Widget build(BuildContext context) {
    String url = "";
    int? number;
    uploadPdftoFirebase() async {
      number = Random().nextInt(10);
      //pick file
      FilePickerResult? result = await FilePicker.platform.pickFiles();
      File pick = File(result!.files.single.path.toString());
      var file = pick.readAsBytesSync();
      String name = "Steel Making PYQ"+DateTime.now().toString();

      //upload file
      var pdfFile = FirebaseStorage.instance.ref(name).child('/.pdf');
      UploadTask task = pdfFile.putData(file);
      TaskSnapshot snapshot = await task;
      url = await snapshot.ref.getDownloadURL();
      //upload url to cloud fire_store
      await FirebaseFirestore.instance.collection('file').doc().set({
        'fileUrl': url,
        'num': "Pyq_SteelMaking" + number.toString(),
      });
    }

    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("file").snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, i) {
                  QueryDocumentSnapshot x = snapshot.data!.docs[i];
                  return InkWell(
                    onTap: (){},
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      child: Text(x["num"]),
                    ),
                  );
                });
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: uploadPdftoFirebase,
        child: const Icon(Icons.add_rounded),
      ),
    );
  }
}
