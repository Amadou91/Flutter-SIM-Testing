import 'package:flutter/material.dart';
import 'package:sim/data/token.dart';
import 'package:sim/widgets/login_table.dart';

var loggedIn = 0;

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // if (x == 1) {
    print("Correct");

    //Navigator.pushNamed(context, "/login");
    return new LoginScreenState();
    //} else {
    //  print("Incorrect");
    //   return new LoginScreenState();
  }
}

final username = TextEditingController();
final password = TextEditingController();

class LoginScreenState extends State<LoginScreen> {
  // Define the focus node. To manage the lifecycle, create the FocusNode in
  // the initState method, and clean it up in the dispose method.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(autofocus: true, controller: username),
            TextField(controller: password),
            loginTable()
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (loggedIn == 0) {
            Navigator.pushNamed(context, '/login');
          } else {
            Navigator.pushNamed(context, '/home');
            print("Logged in");
            print("Token :" + authToken);
          }
        },
        tooltip: 'Focus Second Text Field',
        child: Icon(Icons.edit),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
