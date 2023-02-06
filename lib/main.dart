import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:week16_api_learning/model/user.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<User> users = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(centerTitle: true, title: Text('Rest API Call')),
        body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            final user = users[index];
            final email = user.gender;
            // final name = user.n
            // final names = user['name'];
            // final name = names['last'];//!because the name have three values
            // final name = user['name']['last']; //TODO: good paractice
            // final email = user['email'];
            // final photo = user['picture']['medium'];

            return ListTile(
              tileColor: user.gender == 'male' ? Colors.blue : Colors.green,
              leading: CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage('${user.photo.large}')),
              title: Text(user.name.first),
              subtitle: Text(user.phone),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: fetchUsers,
          child: Icon(Icons.done),
        ));
  }

  void fetchUsers() async {
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
    setState(() {
      users = transformed;
    });
    print('fetchUsers completed');
  }
}
