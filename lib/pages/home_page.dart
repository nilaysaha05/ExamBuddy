import 'package:flutter/material.dart';
import 'package:mme_notes_app/colours.dart';
import 'package:mme_notes_app/pages/semester/eighth_sem_page.dart';
import 'package:mme_notes_app/pages/semester/fifth_sem_page.dart';
import 'package:mme_notes_app/pages/semester/first_sem_page.dart';
import 'package:mme_notes_app/pages/semester/fourth_sem_page.dart';
import 'package:mme_notes_app/pages/notification_page.dart';
import 'package:mme_notes_app/pages/profile_page.dart';
import 'package:mme_notes_app/pages/semester/second_sem_page.dart';
import 'package:mme_notes_app/pages/semester/seventh_sem_page.dart';
import 'package:mme_notes_app/pages/semester/sixth_sem_page.dart';
import 'package:mme_notes_app/pages/semester/third_sem_page.dart';
import 'package:mme_notes_app/widgets/semester_page_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: white,
        toolbarHeight: 20.0,
      ),
      body: ListView(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 55,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: offWhite,
                  ),
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const ProfilePage(),
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.person_rounded,
                      size: 30,
                      color: blue,
                    ),
                  ),
                ),
                Container(
                  height: 55,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: offWhite,
                  ),
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const NotificationPage(),
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.notifications_rounded,
                      size: 30,
                      color: blue,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const Center(
            child: Text(
              "Hey Nilay,",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 18,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: Center(
              child: Text(
                "This app is only for back benchers toppers are requested to uninstall the app.... ",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black54,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(
            height: 30.0,
          ),
          SemesterPage(
            semester: "First Semester",
            subject: "5 sub 1 lab",
            color: indigo,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const FirstSemPage(),
                ),
              );
            },
          ),
          SemesterPage(
            semester: "Second Semester",
            subject: "5 sub 1 lab",
            color: black,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const SecondSemPage(),
                ),
              );
            },
          ),
          SemesterPage(
            semester: "Third Semester",
            subject: "5 sub 1 lab",
            color: red,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const ThirdSemPage(),
                ),
              );
            },
          ),
          SemesterPage(
            semester: "Fourth Semester",
            subject: "5 sub 1 lab",
            color: blue,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const FourthSemPage(),
                ),
              );
            },
          ),
          SemesterPage(
            semester: "Fifth Semester",
            subject: "5 sub 1 lab",
            color: black,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const FifthSemPage(),
                ),
              );

            },
          ),
          SemesterPage(
            semester: "Sixth Semester",
            subject: "5 sub 2 lab",
            color: red,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const SixthSemPage(),
                ),
              );
            },
          ),
          SemesterPage(
            semester: "Seventh Semester",
            subject: "5 sub 1 lab",
            color: indigo,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const SeventhSemPage(),
                ),
              );
            },
          ),
          SemesterPage(
            semester: "Eighth Semester",
            subject: "5 sub 1 lab",
            color: black,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const EighthSemPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
