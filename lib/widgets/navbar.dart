import 'package:flutter/material.dart';
import 'package:sim/data/token.dart';
import 'package:sim/pages/login.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListTileTheme(

          textColor: Color(0xFFFFFFFF),
          //  tileColor: Color(0xFFED2228),
            selectedTileColor: Colors.redAccent,
            selectedColor: Colors.redAccent,

            child: ListView(padding: EdgeInsets.zero, children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text("John Orban"),
                accountEmail: Text("JohnBOrban@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  radius: 30.0,
                  backgroundImage: AssetImage('assets/images/150.png'),
                  //backgroundColor: Colors.transparent,
                ),
              ),
              ListTile(
                hoverColor: Colors.redAccent,
                  title: Text('Users',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  onTap: () {
                    Navigator.pushNamed(context, '/users');
                  }),
              ListTile(
                  hoverColor: Colors.redAccent,
                  title: Text('Sites',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  onTap: () {
                    Navigator.pushNamed(context, '/sites');
                  }),
              ListTile(
                  hoverColor: Colors.redAccent,
                  title: Text('Questions',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  onTap: () {
                    Navigator.pushNamed(context, '/questions');
                  }),
              ListTile(
                  hoverColor: Colors.redAccent,
                  title: Text('Quizzes',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  onTap: () {
                    Navigator.pushNamed(context, '/quizzes');
                  }),
              ListTile(
                  hoverColor: Colors.redAccent,
                  title: Text('Quiz',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  onTap: () {
                    Navigator.pushNamed(context, '/quiz');
                  }),
              ListTile(
                  hoverColor: Colors.redAccent,
                  title: Text('Inductions',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  onTap: () {
                    Navigator.pushNamed(context, '/inductions');
                  }),
              ListTile(
                  hoverColor: Colors.redAccent,
                  title: Text('Add Global License',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  onTap: () {
                    Navigator.pushNamed(context, '/add_license');
                  }),
              ListTile(
                  hoverColor: Colors.redAccent,
                  title: Text('License Receipts',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  onTap: () {
                    Navigator.pushNamed(context, '/license_receipts');
                  }),
              ListTile(
                  hoverColor: Colors.redAccent,
                  title: Text('Logout',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold)),
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
