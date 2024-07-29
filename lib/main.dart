import 'package:flutter/material.dart';
import 'package:student_database/controller/service.dart';
import 'package:student_database/view/screens/homepage.dart';

Studentservices _studentservices = Studentservices();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _studentservices.database;
  runApp(
    MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "student data",
        home: HomePage()),
  );
}
