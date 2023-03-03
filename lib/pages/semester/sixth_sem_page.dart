import 'package:flutter/material.dart';
import 'package:mme_notes_app/colours.dart';
import 'package:mme_notes_app/pages/notes_pyq_page.dart';
import 'package:mme_notes_app/widgets/subject_page_tile.dart';

class SixthSemPage extends StatelessWidget {
  const SixthSemPage({Key? key}) : super(key: key);

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
              "Sixth Semester",
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
            subjectName: "Steel Making",
            profName: "Prof. R. Dey",
            color: indigo,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const NoteAndPyqPage(
                    'Steel_Notes',
                    'Steel_Pyq',
                    'Steel Making',
                    'Previous year Questions',
                    'Class Notes',
                  ),
                ),
              );
            },
          ),
          SubjectPage(
            subjectName: "Foundry Metallurgy",
            profName: "Prof. S. Hembram",
            color: black,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const NoteAndPyqPage(
                    'Foundry_Notes',
                    'Foundry_Pyq',
                    'Foundry Metallurgy',
                    'Previous year Questions',
                    'Class Notes',
                  ),
                ),
              );
            },
          ),
          SubjectPage(
            subjectName: "Extraction of Nonferrous Metals",
            profName: "Prof. S. paul",
            color: red,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => const NoteAndPyqPage(
                      'Nonferrous_Notes',
                      'Nonferrous_Pyq',
                      'Nonferrous Metals',
                      'Previous year Questions',
                      'Class Notes',
                    ),),
              );
            },
          ),
          SubjectPage(
            subjectName: "Solid-state Phase Transformation Process",
            profName: "Prof. A. Kundu",
            color: blue,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => const NoteAndPyqPage(
                      'Solid-state_Notes',
                      'Solid-state_Pyq',
                      'Solid-state Phase',
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
                          'Oe_Notes',
                          'Oe_Pyq',
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
            subjectName: "Foundry Metallurgy",
            profName: "Prof. R. Dey & Prof. S. Hembram",
            color: red,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) =>const NoteAndPyqPage(
                      'Foundry_Lab_A1',
                      'Foundry_Lab_A2',
                      'Foundry Metallurgy Lab',
                      'Group A1',
                      'Group A2',
                    ),),
              );
            },
          ),
          SubjectPage(
            subjectName: "Heat Treatment Practice & MicroStructure Analysis",
            profName: "Prof. A. Kundu & Prof. P. C. Chakraborti",
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
          SubjectPage(
            subjectName: "Computer Application in Metallurgy",
            profName: "Prof. S. Paul & Prof. R. Dey",
            color: black,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const NoteAndPyqPage(
                    'Comp_Lab_A1',
                    'Comp_Lab_A2',
                    'Computer Lab',
                    'Group A1',
                    'Group A2',
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
              'Honors Subject',
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
            subjectName: "Surface Engineering & Coating Technology",
            profName: "Prof. S. Hembram",
            color: red,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const NoteAndPyqPage(
                    'Surface_Notes',
                    'Surface_Pyq',
                    'Surface Engineering',
                    'Previous year Questions',
                    'Class Notes',
                  ),),
              );
            },
          ),
        ],
      ),
    );
  }
}
