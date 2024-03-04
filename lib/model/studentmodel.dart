class StudentModel {
  int? id;
  String rollnumber;
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
    final rollnumber = map['rollnumber'] as String;
    final name = map['name'] as String;
    final classes = map['class'] as String? ?? '';
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

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'class': classes,
      'rollNumber': rollnumber,
      'address': address,
      'phone': phone,
      'name': name,
      'photoName': photo == null ? '' : photo!
    };
  }
}
