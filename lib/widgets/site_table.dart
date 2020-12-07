import 'package:flutter/material.dart';
import '../data/sites.dart';

class SiteTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      FutureBuilder<Sites>(
        future: fetchSites(),
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
                            Text("Site Name",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold)),
                            Text("Job Number",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold)),
                            Text("Date Created",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold)),
                            Text("Active",
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
                for (var i in snapshot.data.sites)
                  Container(
                    color: Color(0xFFd3d2d3),
                    //padding: EdgeInsets.all(20.0),
                    child: Table(
                      border: TableBorder.symmetric(
                          inside: BorderSide.none, outside: BorderSide.none),
                      children: [
                        TableRow(children: [
                          Text(i.siteName,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold)),
                          Text(i.jobNumber.toString(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold)),
                          Text(i.dateCreated.toString(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold)),
                          Text(i.active.toString(),
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
