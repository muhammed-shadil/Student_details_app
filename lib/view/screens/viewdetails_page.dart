// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:typed_data';

import 'package:flutter/material.dart';

import 'package:student_database/model/studentmodel.dart';
import 'package:student_database/view/screens/editpage.dart';
import 'package:student_database/view/widgets/custom_textfield.dart';
import 'package:student_database/view/widgets/custombutton2.dart';
import 'package:student_database/view/widgets/sizedbox20.dart';

class Viewpage extends StatefulWidget {
  Viewpage({
    Key? key,
    required this.id,
    required this.rollNo,
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
  // late Uint8List image;

  @override
  State<Viewpage> createState() => _EditpageState();
}

class _EditpageState extends State<Viewpage> {
  final TextEditingController _namecontroll = TextEditingController();
  final TextEditingController _rollcontroll = TextEditingController();
  final TextEditingController _classcontroll = TextEditingController();
  final TextEditingController _phonecontroll = TextEditingController();
  final TextEditingController _addresscontroll = TextEditingController();
  @override
  void initState() {
    _namecontroll.text = widget.name;
    _classcontroll.text = widget.classes;
    _addresscontroll.text = widget.address;
    _rollcontroll.text = widget.rollNo;
    _phonecontroll.text = widget.phone;
    super.initState();
  }

  @override
  void dispose() {
    _addresscontroll.dispose();
    _classcontroll.dispose();
    _namecontroll.dispose();
    _phonecontroll.dispose();
    _rollcontroll.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("DETAILS"),
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
                            textenable: true,
                            controlle: _rollcontroll,
                            hint: "Roll number",
                          ),
                          const SizedBox20(),
                          CustomTextfield(
                            textenable: true,
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
                  textenable: true,
                  controlle: _namecontroll,
                  hint: "Name",
                ),
                const SizedBox20(),
                CustomTextfield(
                  textenable: true,
                  controlle: _phonecontroll,
                  hint: "phone number",
                ),
                const SizedBox20(),
                CustomTextfield(
                  textenable: true,
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
                        text: "EDIT",
                        color: Colors.green,
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => Editpage(
                                        id: widget.id,
                                        rollNo: _rollcontroll.text,
                                        phone: _phonecontroll.text,
                                        name: _namecontroll.text,
                                        classes: _classcontroll.text,
                                        address: _addresscontroll.text,
                                      )));
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
}
