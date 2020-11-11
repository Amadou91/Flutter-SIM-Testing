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
  final List<UserData> users;

  Users({this.users});

  factory Users.fromJson(Map<String, dynamic> parsedJson) {
    var list = parsedJson['users'] as List;
    print(list);
    List<UserData> usersList = list.map((i) => UserData.fromJson(i)).toList();

    return Users(users: usersList);
  }
}
class UserData {
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

  UserData(
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

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
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


class UserTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      FutureBuilder<Users>(
        future: fetchUsers(),
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
        ]);
  }
}
