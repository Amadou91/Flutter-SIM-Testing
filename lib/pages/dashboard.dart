import 'package:flutter/material.dart';
import 'package:sim/widgets/footer.dart';
import 'package:sim/widgets/navbar.dart';

class DashScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text("Dashboard"),
      ),
      body: Container(
          padding: EdgeInsets.all(50),
          child: Center(
              child: Container(
                  padding: EdgeInsets.all(50),
                  color: Colors.white,
                  child: Column(children: [
                    Image(

                        image:
                            AssetImage('assets/images/engdoc-logo-main.png')),
                    Text("\n" + "Site Induction Manager" + "\n"),
                  ])))),
      bottomNavigationBar: MyFooter(),
    );
  }
}
