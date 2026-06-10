import 'package:flutter/material.dart';

class StudentHomeView extends StatefulWidget {
  const StudentHomeView({super.key});

  @override
  State<StudentHomeView> createState() => _StudentHomeViewState();
}

class _StudentHomeViewState extends State<StudentHomeView> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Student Home",
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      ),
    );
  }
}
