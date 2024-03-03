import 'package:flutter/material.dart';
import 'package:student_database/controller/service.dart';
import 'package:student_database/model/studentmodel.dart';
import 'package:student_database/view/widgets/custom_textfield.dart';
import 'package:student_database/view/widgets/custombutton2.dart';
import 'package:student_database/view/widgets/sizedbox20.dart';

class AddDetails extends StatefulWidget {
  const AddDetails({super.key});

  @override
  State<AddDetails> createState() => _AddDetailsState();
}

final rollcontroll = TextEditingController();

Studentservices _studentservices = Studentservices();
final _classcontroll = TextEditingController();
final _namecontroll = TextEditingController();
final _phonecontroll = TextEditingController();
final _addresscontroll = TextEditingController();

class _AddDetailsState extends State<AddDetails> {
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
                            controlle: rollcontroll,
                            hint: "Roll number",
                          ),
                          const SizedBox20(),
                          CustomTextfield(
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
                  controlle: _namecontroll,
                  hint: "Name",
                ),
                const SizedBox20(),
                CustomTextfield(
                  controlle: _phonecontroll,
                  hint: "phone number",
                ),
                const SizedBox20(),
                CustomTextfield(
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
                        text: "ADD",
                        color: Colors.green,
                        onPressed: () {
                          addstudentbuttonclick();
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

  Future<void> addstudentbuttonclick() async {
    final _name = _namecontroll.text.trim();
    final _rollnumber = int.tryParse(rollcontroll.text) ?? 0;
    final _classes = _classcontroll.text.trim();
    final _phone = _phonecontroll.text.trim();
    final _address = _addresscontroll.text.trim();
    final _photo = _phonecontroll.text.trim();
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
    _studentservices.addstudents(_student);
  }
}
