import 'package:flutter/material.dart';
import 'package:student_database/controller/service.dart';
import 'package:student_database/model/studentmodel.dart';
import 'package:student_database/view/screens/add_datapage.dart';
import 'package:student_database/view/screens/editpage.dart';
import 'package:student_database/view/widgets/tile.dart';

class StudentList extends StatelessWidget {
  StudentList({super.key});
  final Studentservices _studentservices = Studentservices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AddDetails()),
          );
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      backgroundColor: Colors.purple.shade50,
      appBar: AppBar(
        title: const Text("STUDENTS"),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.purple, Colors.blue],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
            ),
          ),
        ),
      ),
      body: ValueListenableBuilder(
        valueListenable: studentNotifier,
        builder:
            (BuildContext context, List<StudentModel> student, Widget? child) {
          return ListView.builder(
            itemCount: student.length,
            itemBuilder: (BuildContext context, int index) {
              var data = student[index];
              print(data.photoname);
              return tile(
                  rollNo: data.rollnumber,
                  phone: data.phone,
                  name: data.name,
                  classes: data.classes,
                  address: data.address,
                  id: data.id!,
                  photo: data.photoname,
                  onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => Editpage(
                              id: data.id,
                              image: data.photoname!,
                              rollNo: data.rollnumber,
                              phone: data.phone,
                              name: data.name,
                              classes: data.classes,
                              address: data.address),
                        ),
                      ));
            },
          );
        },
      ),
    );
  }

  Future<void> onupdatedstudent(StudentModel data) async {
    final name = data.name;
    final rollnumber = data.rollnumber;
    final classes = data.classes;
    final phone = data.phone;
    final address = data.address;
    final photo = data.photoname;

    final student = StudentModel(
        rollnumber: rollnumber,
        name: name,
        classes: classes,
        phone: phone,
        address: address,
        photoname: photo);

    _studentservices.updatestudent(student);
  }
}
