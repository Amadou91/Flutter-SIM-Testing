import 'package:flutter/material.dart';
import 'package:sim/data/token.dart';
import 'package:sim/pages/login.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListTileTheme(
            child: ListView(padding: EdgeInsets.zero, children: <Widget>[
              UserAccountsDrawerHeader(
        accountName: Text("John Orban"),
        accountEmail: Text("JohnBOrban@gmail.com"),
        currentAccountPicture: CircleAvatar(
          radius: 30.0,
          backgroundImage: AssetImage('assets/images/150.png'),
          backgroundColor: Colors.transparent,
        ),
      ),
              ListTile(
          title: Text('Users',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(0xFFd3d2d3), fontWeight: FontWeight.bold)),
          onTap: () {
            Navigator.pushNamed(context, '/users');
          }),
              ListTile(
          title: Text('Sites',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(0xFFd3d2d3), fontWeight: FontWeight.bold)),
          onTap: () {
            Navigator.pushNamed(context, '/sites');
          }),
              ListTile(
                  title: Text('Questions',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                  color: Color(0xFFd3d2d3), fontWeight: FontWeight.bold)),
                  onTap: () {
            Navigator.pushNamed(context, '/questions');
          }),
              ListTile(
                  title: Text('Quizzes',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                  color: Color(0xFFd3d2d3), fontWeight: FontWeight.bold)),
                  onTap: () {
            Navigator.pushNamed(context, '/quizzes');
          }),
              ListTile(
                  title: Text('Quiz',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(0xFFd3d2d3), fontWeight: FontWeight.bold)),
          onTap: () {
            Navigator.pushNamed(context, '/quiz');
          }),
              ListTile(
                  title: Text('Inductions',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(0xFFd3d2d3), fontWeight: FontWeight.bold)),
          onTap: () {
            Navigator.pushNamed(context, '/inductions');
          }),
              ListTile(
                  title: Text('Add Global License',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(0xFFd3d2d3), fontWeight: FontWeight.bold)),
          onTap: () {
            Navigator.pushNamed(context, '/add_license');
          }),
              ListTile(
                  title: Text('License Receipts',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(0xFFd3d2d3), fontWeight: FontWeight.bold)),
                  onTap: () {
            Navigator.pushNamed(context, '/license_receipts');
          }),
              ListTile(
                  title: Text('Logout',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(0xFFd3d2d3), fontWeight: FontWeight.bold)),
          onTap: () {
            loggedIn = 0;
            authToken = "";
            password.text = "";
            username.text = "";
            Navigator.pushNamed(context, '/login');
          })
    ])));
  }
}
