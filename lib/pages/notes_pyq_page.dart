import 'package:flutter/material.dart';
import 'package:mme_notes_app/colours.dart';
import 'package:mme_notes_app/pages/pyq_notes_page.dart';
import 'package:mme_notes_app/widgets/subject_page_tile.dart';

class NoteAndPyqPage extends StatelessWidget {
 const NoteAndPyqPage(
      this.pathNote, this.pathPyq, this.subjectName, this.labGr1, this.labGr2,
      {Key? key})
      : super(key: key);

  final String pathNote;
  final String pathPyq;
  final String subjectName;
  final String labGr1;
  final String labGr2;

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
      ),
      backgroundColor: white,
      body: ListView(
        children: [
          Center(
            child: SizedBox(
              child: Text(
                subjectName,
                overflow: TextOverflow.ellipsis,
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(
            height: 40.0,
          ),
          SubjectPage(
            subjectName: labGr1,
            profName: '',
            color: indigo,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => PyqAndClassNote(pathPyq,'Notes_Pyq'),
                ),
              );
            },
          ),
          SubjectPage(
            subjectName: labGr2,
            profName: '',
            color: red,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => PyqAndClassNote(pathNote,'Notes_Pyq'),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
