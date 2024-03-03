// ignore_for_file: public_member_api_docs, sort_constructors_first
class StudentModel {
  int? id;
  int rollnumber;
  String name;
  String classes;
  String phone;
  String address;
  String photo;
  StudentModel({
     this.id,
    required this.rollnumber,
    required this.name,
    required this.classes,
    required this.phone,
    required this.address,
    required this.photo,
  });
 static StudentModel fromMap(Map<String, Object?> map) {
    final id = map['id'] as int;
    final rollnumber = map['rollnumber'] as int;
    final name = map['name'] as String;
    final classes = map['classes'] as String? ?? '';
    final phone = map['phone'] as String? ?? '';
    final photo = map['photo'] as String? ?? '';
    final address = map['address'] as String? ?? '';
    return StudentModel(
        id: id,
        rollnumber: rollnumber,
        name: name,
        classes: classes,
        phone: phone,
        address: address,
        photo: photo);
  }
}
