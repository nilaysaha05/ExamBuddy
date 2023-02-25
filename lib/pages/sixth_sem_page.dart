import 'package:flutter/material.dart';
import 'package:mme_notes_app/colours.dart';
import 'package:mme_notes_app/pages/steel_making_page.dart';
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
        leading: AppBar(
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
                  builder: (context) => const SteelMaking(),
                ),
              );
            },
          ),
          SubjectPage(
            subjectName: "Foundry Metallurgy",
            profName: "Prof. S. Hembram",
            color: black,
            onTap: () {},
          ),
          SubjectPage(
            subjectName: "Extraction of Nonferrous Metals",
            profName: "Prof. S. paul",
            color: red,
            onTap: () {},
          ),
          SubjectPage(
            subjectName: "Solid-state Phase Transformation Process",
            profName: "Prof. A. Kundu",
            color: blue,
            onTap: () {},
          ),
          SubjectPage(
            subjectName: "Open Elective",
            profName: "",
            color: black,
            onTap: () {},
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
            onTap: () {},
          ),
          SubjectPage(
            subjectName: "Heat Treatment Practice & MicroStructure Analysis",
            profName: "Prof. A. Kundu & Prof. P. C. Chkraborti",
            color: indigo,
            onTap: () {},
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
            color: black,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
