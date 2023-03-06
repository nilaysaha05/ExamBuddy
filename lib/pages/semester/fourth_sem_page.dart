import 'package:flutter/material.dart';
import 'package:mme_notes_app/utils/colours.dart';
import 'package:mme_notes_app/pages/notes_pyq_page.dart';
import 'package:mme_notes_app/widgets/subject_page_tile.dart';

class FourthSemPage extends StatelessWidget {
  const FourthSemPage({Key? key}) : super(key: key);

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
              "Fourth Semester",
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
            subjectName: "Fuel & Combustion",
            profName: "Chemical Engg. Dept.",
            color: indigo,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const NoteAndPyqPage(
                    'Fuel_Notes',
                    'Fuel_Pyq',
                    'Fuel & Combustion',
                    'Previous year Questions',
                    'Class Notes',
                  ),
                ),
              );
            },
          ),
          SubjectPage(
            subjectName: "Machine Design & Drawing",
            profName: "Mech Engg. Dept",
            color: black,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const NoteAndPyqPage(
                    'Machine_Notes',
                    'Machine_Pyq',
                    'Machine Design',
                    'Previous year Questions',
                    'Class Notes',
                  ),
                ),
              );
            },
          ),
          SubjectPage(
            subjectName: "Material Science",
            profName: "Prof. P. C. Chakraborti",
            color: red,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const NoteAndPyqPage(
                    'Material_Sc_Notes',
                    'Material_Sc_Pyq',
                    'Material Science',
                    'Previous year Questions',
                    'Class Notes',
                  ),),
              );
            },
          ),
          SubjectPage(
            subjectName: "Thermodynamics of Materials",
            profName: "Guest Faculty",
            color: blue,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const NoteAndPyqPage(
                    'Thermo_Notes',
                    'Thermo_Pyq',
                    'Thermodynamics',
                    'Previous year Questions',
                    'Class Notes',
                  ),),
              );
            },
          ),
          SubjectPage(
            subjectName: "Testing of Materials",
            profName: "Prof. M. B. Sk",
            color: black,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const NoteAndPyqPage(
                    'Testing_Notes',
                    'Testing_Pyq',
                    'Testing of Materials',
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
            subjectName: "Basic Physical Metallurgy Lab",
            profName: "Prof. M. B. Sk & Prof. S. Hembram",
            color: red,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) =>const NoteAndPyqPage(
                    'physical_met_Lab_A2',
                    'physical_metLab_A1',
                    'Physical Metallurgy Lab',
                    'Group A1',
                    'Group A2',
                  ),),
              );
            },
          ),
          SubjectPage(
            subjectName: "Mechanical Testing & Inspection of Materials",
            profName: "Prof. P. C. Chakraborti & Prof. M. B. Sk",
            color: indigo,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const NoteAndPyqPage(
                    'Testing_Lab_A2',
                    'Testing_Lab_A1',
                    'Mechanical Testing Lab',
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

