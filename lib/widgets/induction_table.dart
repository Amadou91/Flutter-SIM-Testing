import 'package:flutter/material.dart';
import 'package:sim/data/induction.dart';

class InductTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      FutureBuilder<Inductions>(
        future: fetchInductions(),
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
                            Text("ID",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold)),
                            Text("Name",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold)),
                            Text("Quiz",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold)),
                            Text("URL",
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
                for (var i in snapshot.data.inductions)
                Container(
                  color: Color(0xFFd3d2d3),
                  //padding: EdgeInsets.all(20.0),
                  child: Table(
                    border: TableBorder.symmetric(
                        inside: BorderSide.none, outside: BorderSide.none),
                    children: [
                      TableRow(children: [
                        Text(i.id.toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold)),
                        Text(i.name.toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold)),
                        Text(i.quiz.name.toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold)),
                        Text(i.url.toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold)),
                      ]),
                      TableRow(
                          children: [Text(""), Text(""), Text(""), Text("")]),
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
