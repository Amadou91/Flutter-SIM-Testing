import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sim/data/auth.dart';
import 'package:sim/widgets/auth_table.dart';

class PageLogin extends StatelessWidget {
  final username = TextEditingController();
  final password = TextEditingController();
  // Define the focus node. To manage the lifecycle, create the FocusNode in
  // the initState method, and clean it up in the dispose method.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Text Field Focus'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // The first text field is focused on as soon as the app starts.
            TextField(autofocus: true, controller: username),
            // The second text field is focused on when a user taps the
            // FloatingActionButton.
            TextField(controller: password),
            Center(child: (AuthTable()))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // When the button is pressed,
        // give focus to the text field using myFocusNode.
        onPressed: () async {
          final body = """{"email":""" +
              '"' +
              username.text.toString() +
              '"' +
              "," +
              '"' +
              """password":""" +
              '"' +
              password.text.toString() +
              '"' +
              "}";
          print(body);
          final response = await http.post('http://localhost/api/users/login',
              body: body, headers: requestHeaders);

          if (response.statusCode == 200) {

            return Login.fromJson(jsonDecode(response.body.toString()));
          } else {
            // If the server did not return a 200 OK response,
            // then throw an exception.
            throw Exception('Failed to load');
          }
        },
        tooltip: 'Focus Second Text Field',
        child: Icon(Icons.edit),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

Login loginFromJson(String str) => Login.fromJson(json.decode(str));

String loginToJson(Login data) => json.encode(data.toJson());

class Login {
  Login({
    this.userId,
    this.role,
    this.email,
    this.token,
    this.uname,
  });

  String userId;
  String role;
  String email;
  String token;
  String uname;

  factory Login.fromJson(Map<String, dynamic> json) => Login(
        userId: json["userId"],
        role: json["role"],
        email: json["email"],
        token: json["token"],
        uname: json["uname"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "role": role,
        "email": email,
        "token": token,
        "uname": uname,
      };
}
