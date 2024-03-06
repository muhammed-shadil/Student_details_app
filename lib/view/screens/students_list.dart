import 'package:flutter/material.dart';
import 'package:student_database/controller/service.dart';
import 'package:student_database/model/studentmodel.dart';
import 'package:student_database/view/screens/add_datapage.dart';
import 'package:student_database/view/screens/editpage.dart';
import 'package:student_database/view/screens/viewdetails_page.dart';

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
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: GestureDetector(
                  onTap: () {
                    if (data.photoname != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => Viewpage(
                            image: data.photoname!,
                            id: data.id,
                            rollNo: data.rollnumber,
                            name: data.name,
                            classes: data.classes,
                            address: data.address,
                            phone: data.phone,
                          ),
                        ),
                      );
                    }
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.only(left: 10, top: 10, bottom: 10),
                    height: 90,
                    decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(3, 2),
                            color: Colors.grey,
                            blurRadius: 10,
                          ),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          flex: 0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              data.photoname == null
                                  ? const CircleAvatar(
                                      radius: 25,
                                      child: Icon(Icons.person_outlined),
                                    )
                                  : CircleAvatar(
                                      radius: 25,
                                      backgroundImage:
                                          MemoryImage(data.photoname!),
                                    ),
                              const SizedBox(
                                width: 10,
                              ),
                              SizedBox(
                                width: 170,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      data.name,
                                      style: const TextStyle(
                                        overflow: TextOverflow.ellipsis,
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      maxLines: 1,
                                      softWrap: true,
                                    ),
                                    Text(
                                      data.rollnumber,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      maxLines: 1,
                                      softWrap: true,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Flexible(
                          flex: 0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                onPressed: () {
                                  if (data.photoname != null) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => Editpage(
                                            image: data.photoname!,
                                            id: data.id,
                                            rollNo: data.rollnumber,
                                            phone: data.phone,
                                            name: data.name,
                                            classes: data.classes,
                                            address: data.address),
                                      ),
                                    );
                                  }
                                },
                                icon: const Icon(Icons.edit),
                              ),
                              IconButton(
                                onPressed: () {
                                  _studentservices.deletestudent(data.id);
                                },
                                icon: const Icon(Icons.delete),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
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
    if (name.isEmpty ||
        classes.isEmpty ||
        phone.isEmpty ||
        address.isEmpty) {
      return;
    }
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
