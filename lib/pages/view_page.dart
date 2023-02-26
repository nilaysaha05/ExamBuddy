import 'dart:async';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mme_notes_app/colours.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:http/http.dart' as http;
import 'package:share_plus/share_plus.dart';

class ViewPage extends StatefulWidget {
  ViewPage(this.itemId, this.path, this.url, {Key? key}) : super(key: key) {
    _reference = FirebaseFirestore.instance.collection(path).doc(itemId);
    _futureData = _reference.get();
  }

  final String itemId;
  final String path;
  final String url;
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
        actions: [
          IconButton(
            onPressed: () async {
               await sharePdf(widget.url);

            },
            icon: const Icon(
              Icons.share_rounded,
              color: blue,
            ),
          ),
        ],
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
            DocumentSnapshot documentSnapshot = snapshot.data!;
            Map data = documentSnapshot.data() as Map;

            String url = '${data['pdf']}';

            return SafeArea(
              child: SfPdfViewer.network(
                url,
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

  Future sharePdf(String pdfUrl) async {
    final uri = Uri.parse(pdfUrl);
    final res = await http.get(uri);
    final bytes = res.bodyBytes;

    final tem = await getTemporaryDirectory();
    final path = '${tem.path}/notes.pdf';
   await File(path).writeAsBytes(bytes);

    await Share.shareFiles([path]);
  }
}
