import 'package:flutter/material.dart';
import 'package:sim/data/token.dart';
import 'package:sim/models/user.dart';
import 'package:sim/pages/fetchlogin.dart';



FutureBuilder<Login> loginTable() {
  return FutureBuilder<Login>(
    future: fetchLogin(),
    //future: fetchLogin(username.text.toString(),password.text.toString()),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        authToken = "Bearer " + snapshot.data.token.toString();
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
  );
}