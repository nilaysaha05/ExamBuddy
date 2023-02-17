import 'package:flutter/material.dart';
import 'package:mme_notes_app/colours.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class UploadPage extends StatefulWidget {
 const  UploadPage({Key? key}) : super(key: key);

  @override
  State<UploadPage> createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  bool loading = false;

  final noteEditingController = TextEditingController();
  final dateEditingController = TextEditingController();
  final String id= DateTime.now().microsecondsSinceEpoch.toString();

  final CollectionReference _reference = FirebaseFirestore.instance.collection('Steel_Pyq');

@override
  void didChangeDependencies() {
    super.didChangeDependencies();
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
          child: Column(
            children: [
          Row(
          children: [
          Padding(
          padding:
              const EdgeInsets.only(top: 8.0, bottom: 5.0),
          child: Container(
            height: 50,
            width: 45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: offWhite,
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
                 decoration: BoxDecoration(border: Border.all(color: Colors.black26)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [const Text("File name"),IconButton(onPressed: (){}, icon: const Icon(Icons.upload))],
                  )),
              const SizedBox(
                height: 20.0,
              ),
              ElevatedButton (onPressed: () {

                Map<String, String> dataToSend=
                    {
                      'note': noteEditingController.text.toString(),
                      'date' : dateEditingController.text.toString(),
                    };

                _reference.doc(id).set(dataToSend);

                Navigator.of(context).pop();


              }, child: const Text("Save")),
            ],
          ),
        ));
  }
}
