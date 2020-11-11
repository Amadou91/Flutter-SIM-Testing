import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<http.Response> fetchUsers() {
  return http.get('http://localhost/api/users');
}


// Create a Form widget.
class PageJson extends StatelessWidget {
  final field1 = TextEditingController();
  final field2 = TextEditingController();
  final field3 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Please Enter a Valid Username'),
      ),
      body: Padding(
          padding: EdgeInsets.all(50),
          child: Column(children: [
            TextField(
              cursorColor: Colors.blueGrey,
              controller: field1,
            ),
            TextField(
              cursorColor: Colors.blueGrey,
              controller: field2,
            ),
            TextField(
              cursorColor: Colors.blueGrey,
              controller: field3,
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(20.0),
              child: Table(
                border: TableBorder.all(color: Colors.black),
                children: [
                  TableRow(children: [
                    Text('Cell 1'),
                    Text('Cell 2'),
                    Text('Cell 3'),
                  ]),
                  TableRow(children: [
                    Text('Cell 4'),
                    Text('Cell 5'),
                    Text('Cell 6'),
                  ])
                ],
              ),
            )
          ])),
      floatingActionButton: FloatingActionButton(
          // backgroundColor: Colors.red,

          // When the user presses the button, show an alert dialog containing
          // the text that the user has entered into the text field.
          onPressed: () {
        field1.text = "1";
        field2.text = "2";
        field3.text = "3";
      }),
    );
  }
}
