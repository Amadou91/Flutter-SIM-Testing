import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sim/data/login.dart';

void main() => runApp(PageLogin());

class PageLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Text Field Focus',
      home: MyCustomForm(),
    );
  }
}

// Define a custom Form widget.
class MyCustomForm extends StatefulWidget {
  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

// Define a corresponding State class.
// This class holds data related to the form.

class _MyCustomFormState extends State<MyCustomForm> {
  final username = TextEditingController();
  final password = TextEditingController();
  // Define the focus node. To manage the lifecycle, create the FocusNode in
  // the initState method, and clean it up in the dispose method.
  FocusNode myFocusNode;
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
            TextField(controller: password)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // When the button is pressed,
        // give focus to the text field using myFocusNode.
        onPressed: () async {
          fetchLogin(username.text,password.text);
        },
        tooltip: 'Focus Second Text Field',
        child: Icon(Icons.edit),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
