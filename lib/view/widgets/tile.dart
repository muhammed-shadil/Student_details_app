// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:student_database/controller/service.dart';

import 'package:student_database/view/screens/editpage.dart';
import 'package:student_database/view/screens/viewdetails_page.dart';

class tile extends StatelessWidget {
   tile({
    Key? key,
    required this.rollNo,
    required this.phone,
    required this.name,
    required this.classes,
    required this.address,
    this.id,this.photo,this.onTap
  }) : super(key: key);
int? id;
  final String rollNo;
  final String phone;
  final String name;
  final String classes;
  final String address;
  Uint8List? photo;
   void Function()? onTap;
  final Studentservices _studentservices = Studentservices();

  @override
  Widget build(BuildContext context) {
    return Padding(
                padding: const EdgeInsets.all(10.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Viewpage(
                          id: id!,
                          rollNo: rollNo,
                          name:name,
                          classes: classes,
                          address: address,
                          phone: phone,
                          image:photo?? Uint8List(0),
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
                              photo == null
                                  ? const CircleAvatar(
                                      radius: 25,
                                      child: Icon(Icons.person_outlined),
                                    )
                                  : CircleAvatar(
                                      radius: 25,
                                      backgroundImage:
                                          MemoryImage(photo!),
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
                                      name,
                                      style: const TextStyle(
                                        overflow: TextOverflow.ellipsis,
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      maxLines: 1,
                                      softWrap: true,
                                    ),
                                    Text(
                                      rollNo,
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
                                onPressed: onTap,
                                icon: const Icon(Icons.edit),
                              ),
                              IconButton(
                                onPressed: () {
                                  _studentservices.deletestudent(id);
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
              );;
  }
}
