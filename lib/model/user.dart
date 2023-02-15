import 'package:week16_api_learning/model/user_dob.dart';
import 'package:week16_api_learning/model/user_location.dart';
import 'package:week16_api_learning/model/user_name.dart';
import 'package:week16_api_learning/model/user_photo.dart';

class User {
  final String gender;
  final String email;
  final String phone;
  final String cell;
  final String nat;
  final UserName name;
  final Picture photo;
  final UserDob dob;
  final UserLocation location;
  User(
      {required this.name,
      required this.gender,
      required this.email,
      required this.phone,
      required this.cell,
      required this.nat,
      required this.photo,
      required this.dob,
      required this.location});

  factory User.fromJson(Map<String, dynamic> e) {
    final photo = Picture.fromMap(e['picture']);
    final name = UserName.fromMap(e['name']);
    final dob = UserDob.fromMap(e['dob']);
    final location = UserLocation.fomMap(e['location']);

    return User(
        gender: e['gender'],
        email: e['email'],
        phone: e['phone'],
        cell: e['cell'],
        nat: e['nat'],
        name: name,
        photo: photo,
        dob: dob,
        location: location);
  }

  String fullName() {
    return '${name.title} ${name.first} ${name.last}';
  }
}
