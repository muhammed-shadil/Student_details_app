import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:student_database/model/studentmodel.dart';

 Database? _databas;
final ValueNotifier<List<StudentModel>> studentNotifier =
    ValueNotifier<List<StudentModel>>([]);

class Studentservices {
  Future<Database> get database async {
    if (_databas != null) return _databas!;
    _databas = await intializedatabase('student.db');
    return _databas!;
  }

  Future<Database> intializedatabase(String s) async { print("initialize");
    return await openDatabase(
      "student.db",
      version: 1,
      onCreate: (db, version) async {
       
        await db.execute(
            "CREATE TABLE student (id INTEGER PRIMARY KEY,name TEXT, rollnumber INTEGER ,class TEXT ,phone TEXT ,address TEXT,photoname TEXT NULL)");
      },
    );
  }

  Future<void> addstudents(StudentModel value) async {
    final db=await database;
    print("adddd");
    await db.rawInsert(
        'INSERT INTO student (rollnumber,class,name , phone,address,photoname) values(?,?,?,?,?,?)',
        [
          value.rollnumber,
          value.classes,
          value.name,
          value.phone,
          value.address,
          value.photo
        ]);
    getallstudents();
    // studentNotifier.value.add(value);
    // studentNotifier.notifyListeners();
  }

  Future<void> getallstudents() async {
    print("updateeee");
    final _values = await _databas!.rawQuery('SELECT * FROM student');
    studentNotifier.value.clear();
    _values.forEach((map) {
      final student = StudentModel.fromMap(map);
      studentNotifier.value.add(student);
      
    });studentNotifier.notifyListeners();
  }
}
