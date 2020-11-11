import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Users> fetchUsers() async {
  final response = await http.get('http://localhost/api/users');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Users.fromJson(jsonDecode(response.body.toString()));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load');
  }
}

class Users {
  final List<UserSites> users;

  Users({this.users});

  factory Users.fromJson(Map<String, dynamic> parsedJson) {
    var list = parsedJson['users'] as List;
    print(list);
    List<UserSites> usersList = list.map((i) => UserSites.fromJson(i)).toList();

    return Users(users: usersList);
  }
}

class UserSites {
  String sId;
  String name;
  String role;
  String phone;
  String email;
  bool active;
  String dateCreated;
  String picture;
  int licenses;
  String discipline;
  int iV;
  String createdBy;
  String id;

  UserSites(
      {this.sId,
      this.name,
      this.role,
      this.phone,
      this.email,
      this.active,
      this.dateCreated,
      this.picture,
      this.licenses,
      this.discipline,
      this.iV,
      this.createdBy,
      this.id});

  factory UserSites.fromJson(Map<String, dynamic> json) {
    return UserSites(
      sId: json['_id'],
      name: json['name'],
      role: json['role'],
      phone: json['phone'],
      email: json['email'],
      active: json['active'],
      dateCreated: json['dateCreated'],
      picture: json['picture'],
      licenses: json['licenses'],
      discipline: json['discipline'],
      iV: json['__v'],
      createdBy: json['createdBy'],
      id: json['id'],
    );
  }
}

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<Users> futureUsers;

  @override
  void initState() {
    super.initState();
    futureUsers = fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Fetch Data Example'),
        ),
        body: Column(children: [
          FutureBuilder<Users>(
            future: futureUsers,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return new Column(
                  children: [
                    for (var i in snapshot.data.users)
                      Container(
                        color: Colors.white,
                        padding: EdgeInsets.all(20.0),
                        child: Table(
                          border: TableBorder.all(color: Colors.black),
                          children: [
                            TableRow(children: [
                              Text(i.name.toString()),
                              Text(i.role.toString()),
                              Text(i.email.toString()),
                            ]),
                            TableRow(children: [
                              Text(i.id.toString()),
                              Text(i.phone.toString()),
                              Text(i.dateCreated.toString()),
                            ])
                          ],
                        ),
                      )
                  ],
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              // By default, show a loading spinner.
              return CircularProgressIndicator();
            },
          ),
        ]),
      ),
    );
  }
}
