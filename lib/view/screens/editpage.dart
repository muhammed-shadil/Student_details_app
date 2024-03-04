// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:student_database/controller/service.dart';

import 'package:student_database/model/studentmodel.dart';
import 'package:student_database/view/widgets/custom_textfield.dart';
import 'package:student_database/view/widgets/custombutton2.dart';
import 'package:student_database/view/widgets/sizedbox20.dart';

class Editpage extends StatefulWidget {
  Editpage({
    Key? key,
    required this.rollNo,
    required this.id,
    required this.phone,
    required this.name,
    required this.classes,
    required this.address,
  }) : super(key: key);
  int? id;
  final String rollNo;
  final String phone;
  final String name;
  final String classes;
  final String address;
  late Uint8List image;

  @override
  State<Editpage> createState() => _EditpageState();
}

class _EditpageState extends State<Editpage> {
  final TextEditingController _namecontroll = TextEditingController();
  final TextEditingController rollcontroll = TextEditingController();
  final TextEditingController _classcontroll = TextEditingController();
  final TextEditingController _phonecontroll = TextEditingController();
  final TextEditingController _addresscontroll = TextEditingController();
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
            child: Column(
              children: [
                const SizedBox20(),
                Row(
                  children: [
                    SizedBox(
                      width: 100,
                      child: Stack(children: [
                        const CircleAvatar(
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
                              onPressed: () {},
                              icon: const Icon(Icons.add_a_photo_outlined)),
                        )
                      ]),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .55,
                      child: Column(
                        children: [
                          CustomTextfield(
                            textenable: false,
                            controlle: rollcontroll,
                            hint: "Roll number",
                          ),
                          const SizedBox20(),
                          CustomTextfield(
                            textenable: false,
                            controlle: _classcontroll,
                            hint: "Class",
                          ),
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
                ),
                const SizedBox20(),
                CustomTextfield(
                  textenable: false,
                  controlle: _phonecontroll,
                  hint: "phone number",
                ),
                const SizedBox20(),
                CustomTextfield(
                  textenable: false,
                  controlle: _addresscontroll,
                  maxline: 5,
                  hint: "Address",
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
                          onupdatedstudent();
                          Navigator.pop(context);
                        },
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        )),
      ),
    );
  }

  Future<void> onupdatedstudent() async {
    final _name = _namecontroll.text.trim();
    final _rollnumber = rollcontroll.text.trim();
    final _classes = _classcontroll.text.trim();
    final _phone = _phonecontroll.text.trim();
    final _address = _addresscontroll.text.trim();
    final _photo = _phonecontroll.text.trim();

    final _student = StudentModel(
        rollnumber: _rollnumber,
        id: widget.id,
        name: _name,
        classes: _classes,
        phone: _phone,
        address: _address,
        photo: _photo);

    _studentservices.updatestudent(_student);
  }
}
