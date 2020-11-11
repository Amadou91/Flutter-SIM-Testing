import 'package:flutter/material.dart';

class MyFooter2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Stack(
        children: [
          Container(
            height: 100.0,
            color: Colors.green,
          ),
          Positioned(
            child: CustomPaint(
              size: Size.infinite,
            ),
          ),
        ],
      ),
    );
  }
}