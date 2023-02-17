import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mme_notes_app/colours.dart';
import 'package:mme_notes_app/pages/file_upload_page.dart';
import 'package:mme_notes_app/widgets/subject_page_tile.dart';

class PyqPage extends StatefulWidget {
  const PyqPage({Key? key}) : super(key: key);

  @override
  State<PyqPage> createState() => _PyqPageState();
}

class _PyqPageState extends State<PyqPage> {
  final CollectionReference _ref =
      FirebaseFirestore.instance.collection('Steel_Pyq');
  late Stream<QuerySnapshot> _stream;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _stream = _ref.snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.0,
        backgroundColor: white,
        toolbarHeight: 30.0,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _stream,
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
                    })
                .toList();

            return ListView.builder(
                itemCount: items.length,
                itemBuilder: (BuildContext context, int index) {
                  //Get the item at this index
                  Map thisItem = items[index];
                  //REturn the widget for the list items
                  return SubjectPage(
                      subjectName: '${thisItem['note']}',
                      profName: '${thisItem['date']}',
                      color: red,
                      onTap: () {});
                });
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const UploadPage(),
            ),
          );
        },
        child: const Icon(Icons.add_rounded),
      ),
    );
  }
}
