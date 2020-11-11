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

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Site Induction Manager',
        initialRoute: '/json',
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
