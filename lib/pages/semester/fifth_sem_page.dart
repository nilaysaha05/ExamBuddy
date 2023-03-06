import 'package:flutter/material.dart';
import 'package:mme_notes_app/utils/colours.dart';
import 'package:mme_notes_app/pages/notes_pyq_page.dart';
import 'package:mme_notes_app/widgets/subject_page_tile.dart';

class FifthSemPage extends StatelessWidget {
  const FifthSemPage({Key? key}) : super(key: key);

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
              "Fifth Semester",
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
            subjectName: "Iron Making",
            profName: "Prof. R. Dey",
            color: indigo,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const NoteAndPyqPage(
                    'Iron_Notes',
                    'Iron_Pyq',
                    'Iron Making',
                    'Previous year Questions',
                    'Class Notes',
                  ),
                ),
              );
            },
          ),
          SubjectPage(
            subjectName: "Physical Metallurgy",
            profName: "Prof. A. Kundu",
            color: black,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const NoteAndPyqPage(
                    'Physical_Notes',
                    'Physical_Pyq',
                    'Physical Metallurgy',
                    'Previous year Questions',
                    'Class Notes',
                  ),
                ),
              );
            },
          ),
          SubjectPage(
            subjectName: "Electrochemistry Corrosion",
            profName: "Prof. S. paul",
            color: red,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const NoteAndPyqPage(
                    'Corrosion_Notes',
                    'Corrosion_Pyq',
                    'Electrochemistry Corrosion',
                    'Previous year Questions',
                    'Class Notes',
                  ),),
              );
            },
          ),
          SubjectPage(
            subjectName: "Chemical Kinetics & Mass Transfer",
            profName: "Guest Faculty",
            color: blue,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const NoteAndPyqPage(
                    'kinetics_Notes',
                    'kinetics_Pyq',
                    'Kinetics & Mass Transfer',
                    'Previous year Questions',
                    'Class Notes',
                  ),),
              );
            },
          ),
          SubjectPage(
            subjectName: "Plastic Deformation of Metals",
            profName: "Prof. P. C. Chakraborti",
            color: blue,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const NoteAndPyqPage(
                    'plastic_Notes',
                    'plastic_Pyq',
                    'Plastic Deformation',
                    'Previous year Questions',
                    'Class Notes',
                  ),),
              );
            },
          ),
          SubjectPage(
            subjectName: "Open Elective",
            profName: "",
            color: black,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const NoteAndPyqPage(
                    'Oe1_Notes',
                    'Oe1_Pyq',
                    'Open Elective',
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
            subjectName: "Physical Metallurgy",
            profName: "Prof. A. Kundu & Prof. P. C. Chakraborti",
            color: red,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) =>const NoteAndPyqPage(
                    'physical2_Lab_A2',
                    'physical2_Lab_A1',
                    'Physical Metallurgy Lab',
                    'Group A1',
                    'Group A2',
                  ),),
              );
            },
          ),
          SubjectPage(
            subjectName: "Electrochemistry & Corrosion Lab",
            profName: "Prof. S. Paul & Prof. S. Banerjee",
            color: indigo,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const NoteAndPyqPage(
                    'Heat_Lab_A1',
                    'Heat_Lab_A2',
                    'Heat Treatment Lab',
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
