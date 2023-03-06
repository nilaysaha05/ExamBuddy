import 'package:flutter/material.dart';
import 'package:mme_notes_app/utils/colours.dart';
import 'package:mme_notes_app/pages/notes_pyq_page.dart';
import 'package:mme_notes_app/widgets/subject_page_tile.dart';

class FirstSemPage extends StatelessWidget {
  const FirstSemPage({Key? key}) : super(key: key);

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
              "First Semester",
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
            subjectName: "Mathematics - 1",
            profName: "",
            color: indigo,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const NoteAndPyqPage(
                    'math1_Notes',
                    'math1_Pyq',
                    'Mathematics - 1',
                    'Previous year Questions',
                    'Class Notes',
                  ),
                ),
              );
            },
          ),
          SubjectPage(
            subjectName: "Physics",
            profName: "",
            color: black,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const NoteAndPyqPage(
                    'physics_Notes',
                    'physics_Pyq',
                    'Physics',
                    'Previous year Questions',
                    'Class Notes',
                  ),
                ),
              );
            },
          ),
          SubjectPage(
            subjectName: "Engineering Mechanics",
            profName: "",
            color: red,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const NoteAndPyqPage(
                    'enggMech_Notes',
                    'enggMech_Pyq',
                    'Engineering Mechanics',
                    'Previous year Questions',
                    'Class Notes',
                  ),),
              );
            },
          ),
          SubjectPage(
            subjectName: "Technical Communication English & Soft Skill",
            profName: "",
            color: blue,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const NoteAndPyqPage(
                    'english_Notes',
                    'english_Pyq',
                    'English & Soft Skill',
                    'Previous year Questions',
                    'Class Notes',
                  ),),
              );
            },
          ),
          SubjectPage(
            subjectName: "Humanities & Sociology",
            profName: "",
            color: black,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const NoteAndPyqPage(
                    'socio_Notes',
                    'socio_Pyq',
                    'Humanities & Sociology',
                    'Previous year Questions',
                    'Class Notes',
                  ),),
              );
            },
          ),
          SubjectPage(
            subjectName: "Chemistry (Physical+Organic+Inorganic)",
            profName: "",
            color: red,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) =>const NoteAndPyqPage(
                    'chem1_Notes',
                    'chem1_Pyq',
                    'Chemistry',
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
            subjectName: "Physics Lab",
            profName: "",
            color: blue,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) =>const NoteAndPyqPage(
                    'physics_Lab_A2',
                    'physics_Lab_A1',
                    'Physics Lab',
                    'Previous year Questions',
                    'Class Notes',
                  ),),
              );
            },
          ),
          SubjectPage(
            subjectName: "Chemistry Lab",
            profName: "Prof. A. Kundu & Prof. P. C. Chakraborti",
            color: black,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const NoteAndPyqPage(
                    'chem_Lab_A2',
                    'chem_Lab_A1',
                    'Chemistry Lab',
                    'Group A1',
                    'Group A2',
                  ),),
              );
            },
          ),
          SubjectPage(
            subjectName: "Workshop",
            profName: "",
            color: indigo,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const NoteAndPyqPage(
                    'workshop_A2',
                    'workshop_A1',
                    'Workshop',
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

