import 'package:flutter/material.dart';
import 'package:sim/widgets/footer.dart';
import 'package:sim/widgets/navbar.dart';

class PageHome extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Padding(
          padding: EdgeInsets.all(50),
          child: Center(
              child: (Text("John Orban's Dashboard",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color(0xFFd3d2d3),
                      fontWeight: FontWeight.bold,
                      fontSize: 50))))),
      bottomNavigationBar: MyFooter(),
    );
  }
}
