import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sim/widgets/auth_table.dart';
import '../data/rest_ds.dart';
import 'fetchlogin.dart';

var x = 0;

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
//}
// Future<Login> fetchLogin(username, password) async {
//   Map<String, String> requestHeaders = {
//     'Content-type': 'application/json',
//     'Accept': '*/*',
//   };
//   // Map<String, String> body = {
//   //   '"email"': '"johnborban@gmail.com"',
//   //   '"password"': '"induction"',
//   // };
//   Map<String, String> body = {
//     '"email"': '"' + username + '"',
//     '"password"': '"' + password + '"',
//   };
//   print(body);
//
//   final response = await http.post('http://localhost/api/users/login',
//       body: body.toString(), headers: requestHeaders);
//
//   if (response.statusCode == 200) {
//     x = 0;
//
//     return Login.fromJson(jsonDecode(response.body.toString()));
//   } else {
//     x = 0;
//     // If the server did not return a 200 OK response,
//     // then throw an exception.
//     throw Exception('Wrong Credentials');
//   }
// }
class LoginScreenState extends State<LoginScreen> {

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
            TextField(autofocus: true, controller: username),
            TextField(controller: password),
            FutureBuilder<Login>(
              future: fetchLogin(),
              //future: fetchLogin(username.text.toString(),password.text.toString()),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return new Column(
                    children: [
                      Container(
                          color: Color(0xFFd3d2d3),
                          child: Table(
                              border: TableBorder.all(color: Colors.black),
                              children: [
                                TableRow(children: [
                                  Text("Email",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold)),
                                  Text("Token",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold)),
                                  Text("uName",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold)),
                                  Text("UserID",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold))
                                ])
                              ])),
                      Container(
                          color: Color(0xFFd3d2d3),
                          child: Table(children: [
                            TableRow(children: [
                              Text("", textAlign: TextAlign.center),
                              Text("", textAlign: TextAlign.center),
                              Text("", textAlign: TextAlign.center),
                              Text("", textAlign: TextAlign.center)
                            ])
                          ])),
                      Container(
                        color: Color(0xFFd3d2d3),
                        //padding: EdgeInsets.all(20.0),
                        child: Table(
                          border: TableBorder.symmetric(
                              inside: BorderSide.none,
                              outside: BorderSide.none),
                          children: [
                            TableRow(children: [
                              Text(snapshot.data.email,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold)),
                              Text(snapshot.data.token,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold)),
                              Text(snapshot.data.uname,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold)),
                              Text(snapshot.data.userId,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold)),
                            ]),
                            TableRow(children: [
                              Text(""),
                              Text(""),
                              Text(""),
                              Text("")
                            ]),
                          ],
                        ),
                      )
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                // By default, show a loading spinner.
                return CircularProgressIndicator();
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //fetchLogin(username.text.toString(),password.text.toString());
          Navigator.pushNamed(context, '/login');
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
