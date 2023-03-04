import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mme_notes_app/colours.dart';
import 'package:mme_notes_app/pages/file_upload_page.dart';
import 'package:mme_notes_app/pages/view_page.dart';
import 'package:mme_notes_app/widgets/subject_page_tile.dart';


class PyqAndClassNote extends StatefulWidget {
   PyqAndClassNote(this.path,this.pathStore,{Key? key}) : super(key: key)
  {
    final CollectionReference ref =
    FirebaseFirestore.instance.collection(path);
    _stream = ref.snapshots();

  }

  late String path;
   late String pathStore;
  late Stream<QuerySnapshot> _stream;


  @override
  State<PyqAndClassNote> createState() => _PyqAndClassNoteState();
}

class _PyqAndClassNoteState extends State<PyqAndClassNote> {

bool _admin = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAdminData();

  }
  void getAdminData() async
  {
    DocumentSnapshot snap = await FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).get();
    setState(() {
      _admin = (snap.data() as Map<String,dynamic>)['admin'];
    });
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
        elevation: 0.0,
        backgroundColor: white,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: widget._stream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }
          if (snapshot.connectionState == ConnectionState.active) {
            QuerySnapshot querySnapshot = snapshot.data;
            List<QueryDocumentSnapshot> documents = querySnapshot.docs;

            //Convert the documents to Maps
            List<Map> items = documents
                .map((e) => {
                      'id': e.id,
                      'note': e['note'],
                      'date': e['date'],
                      'pdf' : e['pdf'],
                    })
                .toList();

            return ListView.builder(
                itemCount: items.length,
                itemBuilder: (BuildContext context, int index) {
                  //Get the item at this index
                  Map thisItem = items[index];
                  //Return the widget for the list items
                  return SubjectPage(
                      subjectName: '${thisItem['note']}',
                      profName: '${thisItem['date']}',
                      color: red,
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>  ViewPage(thisItem['id'],widget.path,thisItem['pdf'],thisItem['note']),
                          ),
                        );
                      });
                });
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
      floatingActionButton: _admin == false ? null : FloatingActionButton(
        backgroundColor: blue,
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) =>  UploadPage(widget.path,widget.pathStore),
            ),
          );
        },
        child: const Icon(Icons.add_rounded),
      ),
    );
  }
}


