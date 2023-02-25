import 'package:flutter/material.dart';
import 'package:mme_notes_app/colours.dart';
import 'package:mme_notes_app/pages/class_notes_page.dart';
import 'package:mme_notes_app/pages/pyq_page.dart';
import 'package:mme_notes_app/widgets/subject_page_tile.dart';

class SteelMaking extends StatelessWidget {
  const SteelMaking({Key? key}) : super(key: key);

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
          const Center(
            child: Text(
              "Steel Making",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 40.0,
          ),
          SubjectPage(
            subjectName: 'Previous year Questions',
            profName: '',
            color: indigo,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const PyqPage(),
                ),
              );

            },
          ),
          SubjectPage(
            subjectName: 'Class Notes',
            profName: '',
            color: red,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const ClassNotes(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
