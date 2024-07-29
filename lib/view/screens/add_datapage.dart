import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student_database/controller/service.dart';
import 'package:student_database/model/studentmodel.dart';
import 'package:student_database/view/widgets/addimage.dart';
import 'package:student_database/view/widgets/custom_textfield.dart';
import 'package:student_database/view/widgets/custombutton2.dart';
import 'package:student_database/view/widgets/sizedbox20.dart';

class AddDetails extends StatefulWidget {
  const AddDetails({super.key});

  @override
  State<AddDetails> createState() => _AddDetailsState();
}

class _AddDetailsState extends State<AddDetails> {
  final Studentservices _studentservices = Studentservices();
  final _rollcontroll = TextEditingController();
  final _classcontroll = TextEditingController();
  final _namecontroll = TextEditingController();
  final _phonecontroll = TextEditingController();
  final _addresscontroll = TextEditingController();
  Uint8List? _image;
  final _formKey = GlobalKey<FormState>();

  void selectImage() async {
    Uint8List? img = await pickImage(ImageSource.gallery);
    setState(() {
      _image = img;
    });
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add students"),
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
                          _image != null
                              ? CircleAvatar(
                                  radius: 50,
                                  backgroundImage: MemoryImage(_image!),
                                )
                              : const CircleAvatar(
                                  radius: 50,
                                  child: Icon(
                                    Icons.person_outline_rounded,
                                    size: 50,
                                  ),
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
                                controlle: _rollcontroll,
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
                          text: "ADD",
                          color: Colors.green,
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              addstudentbuttonclick();
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

  Future<void> addstudentbuttonclick() async {
    final name = _namecontroll.text.trim();
    final rollnumber = _rollcontroll.text.trim();
    final classes = _classcontroll.text.trim();
    final phone = _phonecontroll.text.trim();
    final address = _addresscontroll.text.trim();
   
    final student = StudentModel(
        rollnumber: rollnumber,
        name: name,
        classes: classes,
        phone: phone,
        address: address,
        photoname: _image);
    _studentservices.addstudents(student);
  }
}
