import 'package:flutter/material.dart';
import 'package:sim/pages/login.dart';
//import '../data/auth.dart';

class AuthTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      FutureBuilder<Login>(
       // future: fetchLogin("johnborban@gmail.com","induction"),
       // future: fetchLogin(LoginScreen().username.text.toString(),LoginScreen().password.text.toString()),
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
                                    fontSize: 12, fontWeight: FontWeight.bold)),
                            Text("Token",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold)),
                            Text("uName",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold)),
                            Text("UserID",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold))
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
                          inside: BorderSide.none, outside: BorderSide.none),
                      children: [
                        TableRow(children: [
                          Text(snapshot.data.email,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold)),
                          Text(snapshot.data.token,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold)),
                          Text(snapshot.data.uname,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold)),
                          Text(snapshot.data.userId,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold)),
                        ]),
                        TableRow(children: [
                          Text(""),
                          Text(""),
                          Text(""),
                          Text("")
                        ]),
                        //TableRow(children: [
                        // Text(i.id.toString()),
                        // Text(i.phone.toString()),
                        // Text(i.dateCreated.toString()),
                        //   ])
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
      ),
    ]);
  }
}
