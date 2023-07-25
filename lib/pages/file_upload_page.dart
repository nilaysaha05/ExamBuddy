import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:mme_notes_app/utils/colours.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

class UploadPage extends StatefulWidget {
  UploadPage(this.pathData, this.pathStore, {Key? key}) : super(key: key) {
    final CollectionReference reference =
        FirebaseFirestore.instance.collection(pathData);
    _ref = reference.doc(DateTime.now().microsecondsSinceEpoch.toString());
  }

  final String pathData;
  final String pathStore;
  late final DocumentReference _ref;

  @override
  State<UploadPage> createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  bool loading = false;
  File? file;
  final _noteEditingController = TextEditingController();
  final _dateEditingController = TextEditingController();
  String pdfUrl = '';
  String _fileText = 'No file Selected';

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _noteEditingController.dispose();
    _dateEditingController.dispose();
  }

  void _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowCompression: true,
    );
    if (result != null && result.files.single.path != null) {
      PlatformFile files = result.files.first;
      final path = result.files.single.path!;

      setState(() {
        file = File(path);
        _fileText = files.name;
      });
    } else {
      return;
    }
  }

  Future _uploadFile() async {
    Reference referenceRoot = FirebaseStorage.instance.ref();
    Reference referenceDirFile = referenceRoot
        .child(widget.pathStore)
        .child(DateTime.now().microsecondsSinceEpoch.toString());
    try {
      await referenceDirFile.putFile(file!);
      pdfUrl = await referenceDirFile.getDownloadURL();
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: white,
        appBar: AppBar(
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
          automaticallyImplyLeading: false,
          backgroundColor: white,
          elevation: 0.0,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: ListView(
            children: [
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: _noteEditingController,
                maxLines: 1,
                decoration: const InputDecoration(
                  hintText: "Title",
                  labelText: "Title",
                  border: OutlineInputBorder(borderSide: BorderSide(color: blue)),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Theme(
                data: new ThemeData(
                  primaryColor: blue,
                  primaryColorDark: Colors.blueAccent,
                ),
                child: TextFormField(
                  controller: _dateEditingController,
                  maxLines: 1,
                  decoration: const InputDecoration(
                    hintText: "dd-mm-yyyy",
                    labelText: "Date",
                    border: OutlineInputBorder(),
                  ),
                ),
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
                      Expanded(
                        child: Text(
                          _fileText,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            _pickFile();
                          },
                          icon: const Icon(Icons.attach_file_rounded))
                    ],
                  )),
              const SizedBox(
                height: 20.0,
              ),
              SizedBox(
                height: 50,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: blue),
                    onPressed: () async {
                      setState(() {
                        loading = true;
                      });

                      await _uploadFile();

                      if (pdfUrl.isEmpty) {
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Please Upload a file..')));
                        }

                        setState(() {
                          loading = false;
                        });
                        return;
                      }

                      Map<String, String> dataToSend = {
                        'note': _noteEditingController.text.toString(),
                        'date': _dateEditingController.text.toString(),
                        'pdf': pdfUrl,
                      };

                      if (_noteEditingController.text != "" &&
                          _dateEditingController.text != "") {
                        widget._ref.set(dataToSend);
                        if (context.mounted) {
                          Navigator.of(context).pop();
                        }
                        setState(() {
                          loading = false;
                        });
                      }
                    },
                    child: loading == true
                        ? const Center(
                            child: CircularProgressIndicator(
                            color: white,
                          ))
                        : const Text("Upload file")),
              ),
            ],
          ),
        ));
  }
}
