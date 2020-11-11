import 'package:flutter/material.dart';

class MyFooter1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        height: 150.0,
        color: Colors.grey,
        child: Text(
          'This is a footer',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 1,
          ),
        ),
      ),

    ]);
  }
}
