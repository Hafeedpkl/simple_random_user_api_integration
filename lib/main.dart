import 'package:flutter/material.dart';
import 'package:week16_api_learning/model/user.dart';
import 'package:week16_api_learning/services/user_api.dart';

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
  void initState() {
    fetchUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(centerTitle: true, title: Text('Rest API Call')),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: ListView.separated(
            separatorBuilder: (context, index) => Divider(),
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
                tileColor: user.gender == 'male'
                    ? Colors.blue.shade100
                    : Colors.pink.shade100,
                leading: CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage('${user.photo.large}')),
                title: Text(user.fullName()),
                subtitle: Text(user.phone),
              );
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: fetchUser,
          child: const Icon(Icons.refresh_rounded),
        ));
  }

  Future<void> fetchUser() async {
    final response = await UserApi.fetchUsers();
    setState(() {
      users = response;
    });
  }
}
