import 'package:flutter/material.dart';
import 'package:mme_notes_app/colours.dart';

class SemesterModel {
  final String semester;
  final String subject;
  final Color color;

  SemesterModel({
    required this.semester,
    required this.subject,
    required this.color,
  });
}

List<SemesterModel> semesterData = [
   SemesterModel(
    semester: "First Semester",
    subject: "6 sub. 3 lab",
    color: indigo,
  ),
  SemesterModel(
    semester: "Second Semester",
    subject: "6 sub. 3 lab",
    color: black,
  ),
  SemesterModel(
    semester: "Third Semester",
    subject: "6 sub. 3 lab",
    color: red,
  ),
  SemesterModel(
    semester: "Fourth Semester",
    subject: "6 sub. 3 lab",
    color: blue,
  ),
  SemesterModel(
    semester: "Fifth Semester",
    subject: "6 sub. 3 lab",
    color: black,
  ),
  SemesterModel(
    semester: "Sixth Semester",
    subject: "6 sub. 3 lab, 1 hon",
    color: red,
  ),
  SemesterModel(
    semester: "Seventh Semester",
    subject: "6 sub. 3 lab, 4 hon",
    color: indigo,
  ),
  SemesterModel(
    semester: "Eighth Semester",
    subject: "6 sub. 3 lab",
    color: black,
  ),


];
