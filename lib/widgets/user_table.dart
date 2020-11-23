import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Users> fetchUsers() async {
  final response =
      ('{"users":[{"sites":[],"contractorRequirements":[],"_id":"5fa18badfbefd9001f9e83a7","name":"JohnOrban","role":"superadmin","phone":"353871234567","email":"johnborban@gmail.com","active":true,"dateCreated":"2020-11-03T16:56:13.914Z","picture":"","licenses":14,"discipline":"administrator","__v":0,"createdBy":"5fa18badfbefd9001f9e83a7","id":"5fa18badfbefd9001f9e83a7"},{"sites":["5fa2c41307e21d0020552aaa","5fa2c41307e21d0020552aaa","5fa2c41307e21d0020552aaa","5fa2c41307e21d0020552aaa","5fa2c41307e21d0020552aaa"],"contractorRequirements":[],"_id":"5fa2bfe39f11370020bb06ce","name":"John Orban","role":"contractor","phone":"353833942186","email":"johnb3orban@gmail.com","active":true,"createdBy":"5fa18badfbefd9001f9e83a7","dateCreated":"2020-11-04T14:51:15.455Z","picture":"","licenses":13,"discipline":"scaffolding","__v":5,"id":"5fa2bfe39f11370020bb06ce"},{"sites":[],"contractorRequirements":[],"_id":"5fa2c00a9f11370020bb06cf","name":"John Orban","role":"admin","phone":"353833942186","email":"Test@gmail.com","active":true,"createdBy":"5fa18badfbefd9001f9e83a7","dateCreated":"2020-11-04T14:51:54.783Z","picture":"","licenses":14,"discipline":"roofing","__v":0,"id":"5fa2c00a9f11370020bb06cf"},{"sites":[],"contractorRequirements":[],"_id":"5fa2c2c707e21d0020552aa5","name":"Tim","role":"subcontractor","phone":"Bob","email":"TimBob@gmail.com","active":true,"createdBy":"5fa2bfe39f11370020bb06ce","dateCreated":"2020-11-04T15:03:35.926Z","picture":"","licenses":0,"discipline":"admin","__v":0,"id":"5fa2c2c707e21d0020552aa5"}]}');
  // final response = await http.get('http://localhost/api/users');

  //if (response.statusCode == 200) {
  // If the server did return a 200 OK response,
  // then parse the JSON.
  return Users.fromJson(jsonDecode(response.toString()));
  //} else {
  // If the server did not return a 200 OK response,
  // then throw an exception.
  //  throw Exception('Failed to load');
  //}
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
                Container(
                    color: Color(0xFFd3d2d3),
                    child: Table(
                        border: TableBorder.all(color: Colors.black),
                        children: [
                          TableRow(children: [
                            Text("Name",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold)),
                            Text("Role",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold)),
                            Text("Email",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                          ])
                        ])),
                Container(
                    color: Color(0xFFd3d2d3),
                    child: Table(children: [
                      TableRow(children: [
                        Text(
                          "",
                          textAlign: TextAlign.center,
                        ),
                        Text("", textAlign: TextAlign.center),
                        Text("", textAlign: TextAlign.center)
                      ])
                    ])),
                for (var i in snapshot.data.users)
                  Container(
                    color: Color(0xFFd3d2d3),
                    //padding: EdgeInsets.all(20.0),
                    child: Table(
                      border: TableBorder.symmetric(
                          inside: BorderSide.none, outside: BorderSide.none),
                      children: [
                        TableRow(children: [
                          Text(i.name, textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold)),
                          Text(i.role.toString(), textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold)),
                          Text(i.email.toString(), textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold)),
                        ]),
                        TableRow(children: [
                          Text(""),
                          Text(""),
                          Text(""),
                        ]),
                        //TableRow(children: [
                        // Text(i.id.toString()),
                        // Text(i.phone.toString()),
                        // Text(i.dateCreated.toString()),
                        //   ])
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
