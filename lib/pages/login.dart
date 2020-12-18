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
      body: Container(
          padding: EdgeInsets.all(100),
          child: Center(
              child: Container(
                  width: 500,
                  padding: EdgeInsets.all(25),
                  color: Colors.white,
                  child: Column(children: [
                    Text("Username:"),
                    TextField(
                        controller: username,
                        decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF777777)),
                        ))),
                    Text("\n" + "Password:"),
                    TextField(

                        controller: password,
                        obscureText: true,
                        decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF777777)),
                        ))),
                    loginTable(),
                  ])))),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (loggedIn == 0) {
            Navigator.pushReplacementNamed(context, '/login');
          } else {
            Navigator.pushReplacementNamed(context, '/dashboard');
            print("Logged in");
            print("Token :" + authToken);
          }
        },
        tooltip: 'Focus Second Text Field',
        child: Icon(Icons.login),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
