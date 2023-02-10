import 'package:flutter/material.dart';

class SubjectPage extends StatelessWidget {
  const SubjectPage({
    Key? key,
    required this.subjectName,
    required this.profName,
    required this.color,
    required this.onTap,
  }) : super(key: key);

  final String subjectName;
  final String profName;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Container(
            height: 140,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: color,
            ),
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    subjectName,
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFFCFEFF),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    profName,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFFCFEFF),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
