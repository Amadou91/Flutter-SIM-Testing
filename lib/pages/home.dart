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
      body: Padding(padding: EdgeInsets.all(50), child: Center(child: (Text("Home")))),
      bottomNavigationBar: MyFooter(),
    );
  }
}
