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
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text(
            'STUDENT APP',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w900, fontSize: 26),
          ),
          centerTitle: true,
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              stops: [
                0.1,
                0.4,
                0.6,
                0.9,
              ],
              colors: [
                Color.fromARGB(255, 212, 239, 252),
                Color.fromARGB(255, 165, 253, 168),
                Color.fromARGB(255, 165, 171, 212),
                Color.fromARGB(255, 150, 240, 231),
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
                SizedBox(
                  height: 58,
                ),
                Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      height: MediaQuery.of(context).size.height * .40,
                      width: MediaQuery.of(context).size.width * .90,
                      child: Image.asset(
                          "assets/check-list-with-done-mard-successful-completion-vector-38884319.jpg"),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: CustomButton1(
                        icon: Icons.list,
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
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      height: MediaQuery.of(context).size.height * .40,
                      width: MediaQuery.of(context).size.width * .90,
                      child: Image.asset(
                          "assets/man-working-with-computer-home-office-student-vector-45854681.jpg"),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: CustomButton1(
                          icon: Icons.add,
                          title: "ADD STUDENT",
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const AddDetails(),
                              ),
                            );
                          }),
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
