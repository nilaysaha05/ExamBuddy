import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:mme_notes_app/colours.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';



class UploadPage extends StatefulWidget {
  const UploadPage({Key? key}) : super(key: key);

  @override
  State<UploadPage> createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
   File? file;
  final noteEditingController = TextEditingController();
  final dateEditingController = TextEditingController();
  final String id = DateTime.now().microsecondsSinceEpoch.toString();
  String pdfUrl='';
  String _fileText = 'No file Selected';

  final CollectionReference _reference =
      FirebaseFirestore.instance.collection('Steel_Pyq');

  void _pickFile () async
  {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      //allowedExtensions: ['pdf'],
    );
    if(result!=null && result.files.single.path!=null)
      {
        PlatformFile files = result.files.first;
       final path = result.files.single.path!;

        setState(() {
          file = File(path);
          _fileText = files.name;
        });
      }
    else{
      return;
    }

  }

  Future _uploadFile () async
  {
    Reference referenceRoot = FirebaseStorage.instance.ref();
    Reference referenceDirFile = referenceRoot.child('pyq').child(id+'Steel_pyq');
    try{
      await referenceDirFile.putFile(file!);
      pdfUrl= await referenceDirFile.getDownloadURL();
    }
    catch(e)
    {
      ScaffoldMessenger.of(context).showSnackBar( SnackBar(content :Text(e.toString())));
    }



  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 30,
          backgroundColor: white,
          elevation: 0.0,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: ListView(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 5.0),
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
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: noteEditingController,
                maxLines: 1,
                decoration: const InputDecoration(
                    hintText: "Note", border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextFormField(
                controller: dateEditingController,
                maxLines: 1,
                decoration: const InputDecoration(
                    hintText: "dd-mm-yyyy", border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Container(
                  padding: const EdgeInsets.all(8),
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black26)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       Text(_fileText),
                      IconButton(
                          onPressed:() {
                            _pickFile();
                          },

                          icon: const Icon(Icons.attach_file_rounded))
                    ],
                  )),
              const SizedBox(
                height: 20.0,
              ),
              ElevatedButton(
                  onPressed: () async {
                    await _uploadFile();

                    if(pdfUrl.isEmpty)
                      {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content :Text('Please Upload a file..')));
                        return;
                      }


                    Map<String, String> dataToSend = {
                      'note': noteEditingController.text.toString(),
                      'date': dateEditingController.text.toString(),
                      'pdf' : pdfUrl,
                    };

                    if(noteEditingController.text!=""&&dateEditingController.text!="") {
                      _reference.doc(id).set(dataToSend);
                      Navigator.of(context).pop();
                    }

                  },
                  child: const Text("Save")),
            ],
          ),
        ));
  }
}
