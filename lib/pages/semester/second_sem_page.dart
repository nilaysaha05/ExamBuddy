import 'package:flutter/material.dart';
import 'package:mme_notes_app/utils/colours.dart';
import 'package:mme_notes_app/pages/notes_pyq_page.dart';
import 'package:mme_notes_app/widgets/subject_page_tile.dart';

class SecondSemPage extends StatelessWidget {
  const SecondSemPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.0,
        backgroundColor: white,
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

      ),
      body: ListView(
        children: [
          const Center(
            child: Text(
              "Second Semester",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 40.0,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 40.0),
            child: Text(
              'Theory Subjects',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
                color: Colors.black54,
              ),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          SubjectPage(
            subjectName: "Mathematics - 2",
            profName: "",
            color: indigo,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const NoteAndPyqPage(
                    'math2_Notes',
                    'math2_Pyq',
                    'Mathematics - 2',
                    'Previous year Questions',
                    'Class Notes',
                  ),
                ),
              );
            },
          ),
          SubjectPage(
            subjectName: "Basic Electrical Engg.",
            profName: "",
            color: black,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const NoteAndPyqPage(
                    'belec_Notes',
                    'belec_Pyq',
                    'Basic Electrical Engg.',
                    'Previous year Questions',
                    'Class Notes',
                  ),
                ),
              );
            },
          ),
          SubjectPage(
            subjectName: "Basic Electronics Engg.",
            profName: "",
            color: red,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const NoteAndPyqPage(
                    'belectronics_Notes',
                    'belectronics_Pyq',
                    'Basic Electronics Engg.',
                    'Previous year Questions',
                    'Class Notes',
                  ),),
              );
            },
          ),
          SubjectPage(
            subjectName: "CP & NM Theory",
            profName: "",
            color: blue,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const NoteAndPyqPage(
                    'cpnm_Notes',
                    'cpnm_Pyq',
                    'CP & NM Theory',
                    'Previous year Questions',
                    'Class Notes',
                  ),),
              );
            },
          ),
          const SizedBox(
            height: 20.0,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 40.0),
            child: Text(
              'Lab',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
                color: Colors.black54,
              ),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          SubjectPage(
            subjectName: "Electrical & Electronics Lab",
            profName: "",
            color: black,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) =>const NoteAndPyqPage(
                    'elec_elctro_lab_A',
                    'elec_elctro_Lab_A',
                    'Electrical & Electronics Lab',
                    'Group A1',
                    'Group A2',
                  ),),
              );
            },
          ),
          SubjectPage(
            subjectName: "Engineering Drawing",
            profName: "",
            color: red,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const NoteAndPyqPage(
                    'eng_draw_A1',
                    'eng_draw_A2',
                    'Engineering Drawing',
                    'Group A1',
                    'Group A2',
                  ),),
              );
            },
          ),
          SubjectPage(
            subjectName: "CP & NM Lab",
            profName: "",
            color: indigo,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const NoteAndPyqPage(
                    'cpnm_Lab_A1',
                    'cpnm_Lab_A2',
                    'CP & NM Lab',
                    'Group A1',
                    'Group A2',
                  ),),
              );
            },
          ),
        ],
      ),
    );
  }
}



