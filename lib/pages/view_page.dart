import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mme_notes_app/colours.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';




class ViewPage extends StatefulWidget {
  ViewPage(this.itemId, {Key? key}) : super(key: key) {
    _reference = FirebaseFirestore.instance.collection("Steel_Pyq").doc(itemId);
    _futureData = _reference.get();
  }

  String itemId;
  late DocumentReference _reference;
  late Future<DocumentSnapshot> _futureData;

  @override
  State<ViewPage> createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  PdfViewerController? _pdfViewerController;

  @override
  void initState() {
    super.initState();
    _pdfViewerController = PdfViewerController();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        actions: [IconButton(onPressed: (){}, icon: const Icon(Icons.share_rounded, color: blue,))],
      ),
      backgroundColor: white,
      body: FutureBuilder<DocumentSnapshot>(
        future: widget._futureData,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                '${snapshot.hasError}',
              ),
            );
          }
          if (snapshot.hasData) {
            DocumentSnapshot documentSnapshot=snapshot.data!;
            Map data = documentSnapshot.data() as Map;

            return SafeArea(
              child: SfPdfViewer.network(
                '${data['pdf']}',
                controller: _pdfViewerController,
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

