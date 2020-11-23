import 'package:flutter/material.dart';

// Create a Form widget.
class PageLogin extends StatelessWidget {
  final username = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Please Enter a Valid Username'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 100),
          child: TextField(
            cursorColor: Color(0xFFED2228),
            controller: username,
            // decoration: InputDecoration(
            //   enabledBorder: UnderlineInputBorder(
            //     borderSide: BorderSide(color: Colors.red),
            //   ),
            //   focusedBorder: UnderlineInputBorder(
            //     borderSide: BorderSide(color: Colors.red),
            //   ),
            //   border: UnderlineInputBorder(
            //     borderSide: BorderSide(color: Colors.red),
            //   ),
            // )
          ),

        ),
        floatingActionButton: FloatingActionButton(
          // backgroundColor: Colors.red,

          // When the user presses the button, show an alert dialog containing
          // the text that the user has entered into the text field.
            onPressed: () {
              if (username.text == "Bryan" ||
                  username.text == "John" ||
                  username.text == "") {
                Navigator.pushReplacementNamed(context, '/home');
              } else {
                return showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: Text("INCORRECT"),
                    );
                  },
                );
              }
            }));
  }
}
