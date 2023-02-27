import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:mme_notes_app/colours.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:http/http.dart' as http;
import 'package:share_plus/share_plus.dart';

class ViewPage extends StatefulWidget {
  ViewPage(this.itemId, this.path, this.url, this.note, {Key? key}) : super(key: key) ;
  final String itemId;
  final String path;
  final String url;
  final String note;

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
      body: SafeArea(
        child: SfPdfViewer.network(
          widget.url,
          controller: _pdfViewerController,
        ),
      ),
    );
  }

  Future sharePdf(String pdfUrl) async {
    final uri = Uri.parse(pdfUrl);
    final res = await http.get(uri);
    final bytes = res.bodyBytes;

    final tem = await getTemporaryDirectory();
    final path = '${tem.path}/'+widget.note+'.pdf';
   await File(path).writeAsBytes(bytes);

    await Share.shareFiles([path]);
  }
}
