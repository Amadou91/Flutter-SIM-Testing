import 'package:flutter/material.dart';
import 'pages/documents.dart';
import 'pages/home.dart';
import 'pages/inductions.dart';
import 'pages/questions.dart';
import 'pages/quiz.dart';
import 'pages/quizzes.dart';
import 'pages/sites.dart';
import 'pages/uploadphoto.dart';
import 'pages/users.dart';
import 'pages/login.dart';
import 'pages/json.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Site Induction Manager',
        initialRoute: '/home',
        routes: {
          '/home': (context) => PageHome(),
          '/json': (context) => PageJson(),
          '/login': (context) => PageLogin(),
          '/users': (context) => PageUsers(),
          '/inductions': (context) => PageInductions(),
          '/questions': (context) => PageQuestions(),
          '/quiz': (context) => PageQuiz(),
          '/quizzes': (context) => PageQuizzes(),
          '/sites': (context) => PageSites(),
          '/uploadphoto': (context) => PageUploadPhoto(),
          '/documents': (context) => PageDocuments(),
        },
        theme: ThemeData(
          // Define the default brightness and colors.
          backgroundColor: Colors.grey,
          primaryColor: Color(0xFFED2228),
          primarySwatch: Colors.blue,
          accentColor: Color(0xFFED2228),
          hoverColor: Color(0xFFd3d2d3),
          scaffoldBackgroundColor: Color(0xFFd3d2d3),
          // cardColor: Color(0xFFA3A9d3),
          // buttonColor: Color(0xFFA3A9d3),
          canvasColor: Color(0xFFED2228),
          // dialogBackgroundColor: Color(0xFFA3A9d3),
          // secondaryHeaderColor: Color(0xFFA3A9d3),
          dividerColor: Color(0xFFA3A9d3),
          // selectedRowColor: Color(0xFFA3A9d3),
          // highlightColor: Color(0xFFA3A9d3),
          // focusColor: Color(0xFFA3A9d3),
          fontFamily: 'Raleway',

          // Define the default font family.


          // Define the default TextTheme. Use this to specify the default
          // text styling for headlines, titles, bodies of text, and more.
          textTheme: TextTheme(
            headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
            headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
            bodyText2: TextStyle(fontSize: 24.0, fontFamily: 'Hind'),
          ),
        ));
  }
}
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

