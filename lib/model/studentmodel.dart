import 'dart:typed_data';

class StudentModel {
  int? id;
  String rollnumber;
  String name;
  String classes;
  String phone;
  String address;
  Uint8List? photoname;
  StudentModel({
    this.id,
    required this.rollnumber,
    required this.name,
    required this.classes,
    required this.phone,
    required this.address,
    this.photoname,
  });
  static StudentModel fromMap(Map<String, dynamic> map) {
    final id = map['id'] as int;
    final rollnumber = map['rollnumber'] as String;
    final name = map['name'] as String;
    final classes = map['class'] as String? ?? '';
    final phone = map['phone'] as String? ?? '';
    final photoname = map['photoname'];
    final address = map['address'] as String? ?? '';
    return StudentModel(
        id: id,
        rollnumber: rollnumber,
        name: name,
        classes: classes,
        phone: phone,
        address: address,
        photoname: photoname);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'class': classes,
      'rollNumber': rollnumber,
      'address': address,
      'phone': phone,
      'name': name,
      'photoName': photoname == null ? '' : photoname!
    };
  }
}
