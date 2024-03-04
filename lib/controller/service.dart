import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:student_database/model/studentmodel.dart';
Database? _databas;
final ValueNotifier<List<StudentModel>> studentNotifier = ValueNotifier([]);
class Studentservices {
  Future<Database> get database async {
    if (_databas != null) return _databas!;
    _databas = await intializedatabase('student.db');
    return _databas!;
  }
 Future<Database> intializedatabase(String s) async {
    return await openDatabase(
      "student.db",
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
            "CREATE TABLE students (id INTEGER PRIMARY KEY,name TEXT NOT NULL, rollnumber TEXT NOT NULL,class TEXT NOT NULL,phone TEXT NOT NULL,address TEXT NOT NULL,photoname TEXT)");
      },
    );
  }

  Future<void> addstudents(StudentModel value) async {
    final db = await database;
    await db.rawInsert(
        'INSERT INTO students (rollnumber,class ,name , phone,address,photoname) values(?,?,?,?,?,?)',
        [
          value.rollnumber,
          value.classes,
          value.name,
          value.phone,
          value.address,
          value.photoname
        ]);
    getallstudents();
  }

  Future<void> getallstudents() async {
    final _values = await _databas!.rawQuery('SELECT * FROM students');
    studentNotifier.value.clear();
    _values.forEach((map) {
      final student = StudentModel.fromMap(map);
      studentNotifier.value.add(student);
    });
    studentNotifier.notifyListeners();
  }

  Future<void> deletestudent(int? id) async {
    print('deleted');
    final db = await database;
    await db.rawDelete('DELETE FROM  students WHERE id=?', [id]);
    getallstudents();
  }

  Future<void> updatestudent(StudentModel values) async {
    final db = await database;
    await db.update('students', values.toMap(),
        where: 'id=?',
        whereArgs: [values.id],
        conflictAlgorithm: ConflictAlgorithm.replace);
    getallstudents();
  }
}
