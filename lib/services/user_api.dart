import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/user.dart';
import '../model/user_name.dart';
import '../model/user_photo.dart';

class UserApi {
 static Future<List<User>> fetchUsers() async {
    print('fetchUsers called');
    const url = 'https://randomuser.me/api/?results=100';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final results = json['results'] as List<dynamic>;
    final transformed = results.map((e) {
      final photo = Picture(
          large: e['picture']['large'],
          medium: e['picture']['medium'],
          thumbnail: e['picture']['thumbnail']);
      final name = UserName(
          title: e['name']['title'],
          first: e['name']['first'],
          last: e['name']['last']);
      return User(
          gender: e['gender'],
          email: e['email'],
          phone: e['phone'],
          cell: e['cell'],
          nat: e['nat'],
          name: name,
          photo: photo);
    }).toList();

    print('fetchUsers completed');
    return transformed;
  }
}
