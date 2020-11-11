import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;

class Welcome {
  List<User> users;

  Welcome({this.users});

  factory Welcome.fromJson(Map<String, dynamic> json) {
    return Welcome(
      users: List<User>.from(json["users"].map((x) => User.fromJson(x))),
    );
  }
}

class User {
  User({
    this.id,
    this.name,
    this.role,
    this.phone,
    this.email,
    this.active,
    this.dateCreated,
    this.picture,
    this.licenses,
    this.discipline,
    this.v,
    this.createdBy,
    this.userId,
  });

  String id;
  String name;
  String role;
  String phone;
  String email;
  bool active;
  DateTime dateCreated;
  String picture;
  int licenses;
  String discipline;
  int v;
  String createdBy;
  String userId;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["_id"],
    name: json["name"],
    role: json["role"],
    phone: json["phone"],
    email: json["email"],
    active: json["active"],
    dateCreated: DateTime.parse(json["dateCreated"]),
    picture: json["picture"],
    licenses: json["licenses"],
    discipline: json["discipline"],
    v: json["__v"],
    createdBy: json["createdBy"],
    userId: json["id"],
  );
}

Future<String> _loadAStudentAsset() async {
  return await rootBundle.loadString('assets/images/data.json');
}

Future<Welcome> loadStudent() async {
  await wait(5);
  String jsonString = await _loadAStudentAsset();
  final jsonResponse = json.decode(jsonString);
  return new Welcome.fromJson(jsonResponse);
}

Future wait(int seconds) {
  return new Future.delayed(Duration(seconds: seconds), () => {});
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp();
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  Widget futureWidget() {
    return new FutureBuilder<Welcome>(
      future: loadStudent(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return new Container(
              padding: new EdgeInsets.all(20.0),
              child: new Row(
                children: [
                  for (var i in snapshot.data.users)
                    Text(i.name.toString() + " " + i.role.toString() + "\n") ,
                ],
              ));
        } else if (snapshot.hasError) {
          return new Text("${snapshot.error}");
        }
        return new CircularProgressIndicator();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: new Scaffold(
            appBar: new AppBar(
              title: new Text('Load Json'),
            ),
            body: futureWidget()));
  }
}
