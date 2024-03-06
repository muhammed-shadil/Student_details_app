// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student_database/controller/service.dart';

import 'package:student_database/model/studentmodel.dart';
import 'package:student_database/view/widgets/addimage.dart';
import 'package:student_database/view/widgets/custom_textfield.dart';
import 'package:student_database/view/widgets/custombutton2.dart';
import 'package:student_database/view/widgets/sizedbox20.dart';

class Editpage extends StatefulWidget {
  Editpage(
      {Key? key,
      required this.rollNo,
      required this.id,
      required this.phone,
      required this.name,
      required this.classes,
      required this.address,
      required this.image})
      : super(key: key);
  int? id;
  final String rollNo;
  final String phone;
  final String name;
  final String classes;
  final String address;
  Uint8List image;

  @override
  State<Editpage> createState() => _EditpageState(image);
}

class _EditpageState extends State<Editpage> {
  late Uint8List _image;

  final TextEditingController _namecontroll = TextEditingController();
  final TextEditingController rollcontroll = TextEditingController();
  final TextEditingController _classcontroll = TextEditingController();
  final TextEditingController _phonecontroll = TextEditingController();
  final TextEditingController _addresscontroll = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  _EditpageState(Uint8List image) {
    _image = image;
  }
  void selectImage() async {
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      _image = img;
    });
  }

  @override
  void initState() {
    _namecontroll.text = widget.name;
    _classcontroll.text = widget.classes;
    _addresscontroll.text = widget.address;
    rollcontroll.text = widget.rollNo;
    _phonecontroll.text = widget.phone;
    super.initState();
  }

  @override
  void dispose() {
    _addresscontroll.dispose();
    _classcontroll.dispose();
    _namecontroll.dispose();
    _phonecontroll.dispose();
    rollcontroll.dispose();
    super.dispose();
  }

  final Studentservices _studentservices = Studentservices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("EDIT DETAILS"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
            child: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * .85,
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox20(),
                  Row(
                    children: [
                      SizedBox(
                        width: 100,
                        child: Stack(children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundImage: MemoryImage(_image),
                          ),
                          Positioned(
                            right: -10,
                            bottom: -10,
                            child: IconButton(
                                onPressed: selectImage,
                                icon: const Icon(Icons.add_a_photo_outlined)),
                          )
                        ]),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .52,
                        child: Column(
                          children: [
                            CustomTextfield(
                                textenable: false,
                                controlle: rollcontroll,
                                hint: "Roll number",
                                validator: (value) {
                                  final age = RegExp(r"^[0-9]{1,2}$");
                                  if (value == null || value.isEmpty) {
                                    return "please enter the roll number ";
                                  } else if (!age.hasMatch(value)) {
                                    return "please enter a valid roll number";
                                  }
                                }),
                            const SizedBox20(),
                            CustomTextfield(
                                textenable: false,
                                controlle: _classcontroll,
                                hint: "Class",
                                validator: (value) {
                                  final age = RegExp(r"^[0-9]{1,2}$");
                                  if (value == null || value.isEmpty) {
                                    return "please enter the class ";
                                  } else if (!age.hasMatch(value)) {
                                    return "please enter a valid class";
                                  }
                                }),
                            const SizedBox20(),
                          ],
                        ),
                      ),
                    ],
                  ),
                  CustomTextfield(
                    textenable: false,
                    controlle: _namecontroll,
                    hint: "Name",
                    validator: (value) {
                      final name = RegExp(r'^[A-Za-z\s]+$');
                      if (value == null || value.isEmpty) {
                        return "please enter name";
                      } else if (value.length < 3) {
                        return "enter a valid name";
                      } else if (!name.hasMatch(_namecontroll.text)) {
                        return "enter a valid name";
                      }
                    },
                  ),
                  const SizedBox20(),
                  CustomTextfield(
                    textenable: false,
                    controlle: _phonecontroll,
                    hint: "phone number",
                    validator: (value) {
                      final reg2 = RegExp(r"^[6789]\d{9}$");
                      if (value == null || value.isEmpty) {
                        return "please enter phone number";
                      } else if (value.length > 10) {
                        return "number must be 10";
                      } else if (!reg2.hasMatch(value)) {
                        return "please enter a valid number";
                      }
                    },
                  ),
                  const SizedBox20(),
                  CustomTextfield(
                    textenable: false,
                    controlle: _addresscontroll,
                    maxline: 5,
                    hint: "Address",
                    validator: (value) {
                      final name = RegExp(r'^[A-Za-z\s]+$');
                      if (value == null || value.isEmpty) {
                        return "please enter address";
                      } else if (value.length < 3) {
                        return "enter a valid address";
                      } else if (!name.hasMatch(_namecontroll.text)) {
                        return "enter a valid address";
                      }
                    },
                  ),
                  const SizedBox20(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .6,
                        child: CustomButton2(
                          text: "CANCEL",
                          color: Colors.red,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .6,
                        child: CustomButton2(
                          text: "update",
                          color: Colors.green,
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              onupdatedstudent();
                              Navigator.pop(context);
                            }
                          },
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        )),
      ),
    );
  }

  Future<void> onupdatedstudent() async {
    final name = _namecontroll.text.trim();
    final rollnumber = rollcontroll.text.trim();
    final classes = _classcontroll.text.trim();
    final phone = _phonecontroll.text.trim();
    final address = _addresscontroll.text.trim();

    final student = StudentModel(
        rollnumber: rollnumber,
        id: widget.id,
        name: name,
        classes: classes,
        phone: phone,
        address: address,
        photoname: _image);

    _studentservices.updatestudent(student);
  }
}
