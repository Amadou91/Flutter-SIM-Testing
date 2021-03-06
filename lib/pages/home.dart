import 'package:flutter/material.dart';
import 'package:sim/widgets/footer.dart';
import 'package:sim/widgets/navbar.dart';

class HomeScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Container(
          padding: EdgeInsets.all(50),
          child: Center(
              child: Container(
                width:500,
                  padding: EdgeInsets.all(50),
                  color: Colors.white,
                  child: Column(children: [
                    Image(
                        width: 500,
                        image:
                            AssetImage('assets/images/engdoc-logo-main.png')),
                    Text("\n" + "Site Induction Manager" + "\n"),
                    RaisedButton(
                        padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                        onPressed: () {Navigator.pushNamed(context, '/login');},
                        child: Text("Log In"))
                  ])))),
      bottomNavigationBar: MyFooter(),
    );
  }
}
