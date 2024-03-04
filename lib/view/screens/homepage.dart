import 'package:flutter/material.dart';
import 'package:student_database/controller/service.dart';
import 'package:student_database/view/screens/add_datapage.dart';
import 'package:student_database/view/screens/students_list.dart';
import 'package:student_database/view/widgets/custombutton1.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final Studentservices _studentservices = Studentservices();
  @override
  Widget build(BuildContext context) {
    _studentservices.getallstudents();
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          stops: [
            0.1,
            0.4,
            0.6,
            0.9,
          ],
          colors: [
            Colors.lightBlue,
            Colors.green,
            Color.fromARGB(255, 87, 97, 154),
            Colors.teal,
          ],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
      ),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton1(
              title: "STUDENT LIST",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => StudentList(),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 40,
            ),
            CustomButton1(
                title: "ADD STUDENT",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const AddDetails(),
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
