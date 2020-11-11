import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Colors.redAccent,
              ),
              accountName: Text("John Orban", textAlign: TextAlign.center),
              accountEmail: Text("JohnBOrban@gmail.com: #5046850", textAlign: TextAlign.center),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Color(0xFFED2228),
                child: Icon(
                  Icons.person,
                  size: 50,
                ),
              ),
            ),
            ListTileTheme(
              child: (ListTile(
                title: Text('Users', textAlign: TextAlign.center),
                onTap: () {
                  Navigator.pushNamed(context, '/users');
                },
              )
              ),
            ),
            ListTileTheme(
              child: (ListTile(
                title: Text('Inductions', textAlign: TextAlign.center,),
                onTap: () {
                  Navigator.pushNamed(context, '/inductions');
                },
              )),
            ),
            ListTileTheme(
              child: (ListTile(
                title: Text('Questions', textAlign: TextAlign.center,),
                onTap: () {
                  Navigator.pushNamed(context, '/questions');
                },
              )),
            ),
            ListTileTheme(
              child: (ListTile(
                title: Text('Quiz', textAlign: TextAlign.center,),
                onTap: () {
                  Navigator.pushNamed(context, '/quiz');
                },
              )),
            ),
            ListTileTheme(
              child: (ListTile(
                title: Text('Quizzes', textAlign: TextAlign.center,),
                onTap: () {
                  Navigator.pushNamed(context, '/quizzes');
                },
              )),
            ),
            ListTileTheme(
              child: (ListTile(
                title: Text('Sites', textAlign: TextAlign.center,),
                onTap: () {
                  Navigator.pushNamed(context, '/sites');
                },
              )),
            ),
            ListTileTheme(
              child: (ListTile(
                title: Text('Upload Photo', textAlign: TextAlign.center,),
                onTap: () {
                  Navigator.pushNamed(context, '/uploadphoto');
                },
              )),
            ),
            ListTileTheme(
              child: (ListTile(
                title: Text('Documents', textAlign: TextAlign.center,),
                onTap: () {
                  Navigator.pushNamed(context, '/documents');
                },
              )),
            ),
          ],

        ));
  }
}
