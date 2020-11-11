// import 'package:flutter/material.dart';
// import 'package:sim/pages/dashboard.dart';
//
// // Create a Form widget.
// class Authenticated extends StatelessWidget {
//   final username = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.red,
//           title: Text('Please Enter a Valid Username'),
//         ),
//         body: Padding(
//           padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 50),
//           child: TextField(
//             controller: username,
//           ),
//         ),
//
//         floatingActionButton: FloatingActionButton(
//           // When the user presses the button, show an alert dialog containing
//           // the text that the user has entered into the text field.
//             onPressed: ()
//             {
//               if (username.text != "Test") {
//                 return showDialog(
//                   context: context,
//                   builder: (context) {
//                     return AlertDialog(
//                       content: Text("INCORRECT"),
//
//                     );
//                   },
//                 );
//               }
//               else {
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => Dashboard())
//                 );
//               }
//             }
//         )
//     );
//   }
// }
//
//
//
//
