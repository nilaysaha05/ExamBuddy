import 'package:flutter/material.dart';
import 'package:mme_notes_app/utils/colours.dart';
import 'package:mme_notes_app/pages/notes_pyq_page.dart';
import 'package:mme_notes_app/widgets/subject_page_tile.dart';

class EighthSemPage extends StatelessWidget {
  const EighthSemPage({Key? key}) : super(key: key);

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
              "Eighth Semester",
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
            subjectName: "Light Metals",
            profName: "Prof. A. K. Pramanik",
            color: indigo,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const NoteAndPyqPage(
                    'light_met_Notes',
                    'light_met_Pyq',
                    'Light Metals',
                    'Previous year Questions',
                    'Class Notes',
                  ),
                ),
              );
            },
          ),
          SubjectPage(
            subjectName: "Joining of Metals",
            profName: "U. K. Maity",
            color: black,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const NoteAndPyqPage(
                    'JM_Notes',
                    'JM_Pyq',
                    'Joining of Metals',
                    'Previous year Questions',
                    'Class Notes',
                  ),
                ),
              );
            },
          ),
          SubjectPage(
            subjectName: "X-Ray & Electron Microscopy",
            profName: "S. Banerjee",
            color: red,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const NoteAndPyqPage(
                    'xray_t_Notes',
                    'xray-t_Pyq',
                    'X-Ray & Electron Microscopy',
                    'Previous year Questions',
                    'Class Notes',
                  ),),
              );
            },
          ),
          SubjectPage(
            subjectName: "Industrial Mgt & Engg Eco",
            profName: "Prof. S. K. Chakraborty",
            color: blue,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const NoteAndPyqPage(
                    'In&Eco_Notes',
                    'In&Eco_Pyq',
                    'Industrial Mgt & Engg Eco',
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
            subjectName: "X-Ray & Electron Microscopy Lab",
            profName: "A. Kundu & S.  Banerjee",
            color: indigo,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) =>const NoteAndPyqPage(
                    'X-ray_Lab_A1',
                    'X-ray_Lab_A2',
                    'X-Ray & Electron Microscopy Lab',
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
              'Honours Subject',
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
            subjectName: "Creep & Fracture Mechanics of Material",
            profName: "Prof. P. C. Chakraborty",
            color: black,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) =>const NoteAndPyqPage(
                    'Creep_Notes',
                    'Creep_pyq',
                    'Creep & Fracture Mechanics of Material',
                    'Previous year Questions',
                    'Class Notes',
                  ),),
              );
            },
          ),
          const SizedBox(
            height: 20.0,
          ),
          SubjectPage(
            subjectName: "Advance Characterisation Techniques",
            profName: "A. Kundu",
            color: red,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) =>const NoteAndPyqPage(
                    'Adv_Char_Notes',
                    'Adv_char_pyq',
                    'Advance Characterisation Techniques',
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
              'Project',
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
            subjectName: "Project Work",
            profName: "All Teachers",
            color: blue,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) =>const NoteAndPyqPage(
                    'Project_ppt2',
                    'project_report2',
                    'Project Work',
                    'Project PPT',
                    'Project Reports',
                  ),),
              );
            },
          ),

        ],
      ),
    );
  }
}



