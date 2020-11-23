import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListTileTheme(
            child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          child: Text('Drawer Header'),
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
        ),
        ListTile(

          hoverColor: Colors.black,
          title: Text('Users', textAlign: TextAlign.center),
          onTap: () {
            Navigator.pushNamed(context, '/users');
          },
        ),
        ListTile(
          title: Text(
            'Inductions',
            textAlign: TextAlign.center,
          ),
          onTap: () {
            Navigator.pushNamed(context, '/inductions');
          },
        ),
        ListTile(
          title: Text(
            'Questions',
            textAlign: TextAlign.center,
          ),
          onTap: () {
            Navigator.pushNamed(context, '/questions');
          },
        ),
        ListTile(
          title: Text(
            'Quiz',
            textAlign: TextAlign.center,
          ),
          onTap: () {
            Navigator.pushNamed(context, '/quiz');
          },
        ),
        ListTile(
          title: Text(
            'Quizzes',
            textAlign: TextAlign.center,
          ),
          onTap: () {
            Navigator.pushNamed(context, '/quizzes');
          },
        ),
        ListTile(
          title: Text(
            'Sites',
            textAlign: TextAlign.center,
          ),
          onTap: () {
            Navigator.pushNamed(context, '/sites');
          },
        ),
        ListTile(
          title: Text(
            'Upload Photo',
            textAlign: TextAlign.center,
          ),
          onTap: () {
            Navigator.pushNamed(context, '/uploadphoto');
          },
        ),
        ListTile(
          title: Text(
            'Documents',
            textAlign: TextAlign.center,
          ),
          onTap: () {
            Navigator.pushNamed(context, '/documents');
          },
        ),
      ],
    )));
  }
}
