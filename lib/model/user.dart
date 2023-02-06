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

  String fullName() {
    return '${name.title} ${name.first} ${name.last}';
  }
}
