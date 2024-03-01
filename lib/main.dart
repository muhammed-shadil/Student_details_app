import 'package:flutter/material.dart';
import 'package:student_database/view/screens/homepage.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "student data",
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text(
            'STUDENTS',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: const HomePage(),
      ),
    ),
  );
}
