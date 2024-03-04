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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => Viewpage(
                          id: data.id,
                          rollNo: data.rollnumber,
                          name: data.name,
                          classes: data.classes,
                          address: data.address,
                          phone: data.phone,
                        ),
                      ),
                    );
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
                              data.photo == null
                                  ? const CircleAvatar(
                                      radius: 30,
                                    )
                                  : CircleAvatar(
                                      radius: 30,
                                    ),
                              const SizedBox(
                                width: 10,
                              ),
                              SizedBox(
                                width: 190,
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
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
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
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => Editpage(
                                          id: data.id,
                                          rollNo: data.rollnumber,
                                          phone: data.phone,
                                          name: data.name,
                                          classes: data.classes,
                                          address: data.address),
                                    ),
                                  );
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
    final _name = data.name;
    final _rollnumber = data.rollnumber;
    final _classes = data.classes;
    final _phone = data.phone;
    final _address = data.address;
    final _photo = data.photo;
    if (_name.isEmpty ||
        _classes.isEmpty ||
        _phone.isEmpty ||
        _address.isEmpty ||
        _photo.isEmpty) {
      return;
    }
    final _student = StudentModel(
        rollnumber: _rollnumber,
        name: _name,
        classes: _classes,
        phone: _phone,
        address: _address,
        photo: _photo);

    _studentservices.updatestudent(_student);
  }
}
