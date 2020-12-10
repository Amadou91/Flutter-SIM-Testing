import 'package:flutter/material.dart';
import 'package:sim/utils/routes.dart';


void main() => runApp(new LoginApp());

class LoginApp extends StatelessWidget {


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Site Induction Manager',
      //initialRoute: '/home',
      theme: new ThemeData(
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
      ),
      routes: routes,
    );
  }


}