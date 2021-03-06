import 'package:flutter/material.dart';
import 'package:sim/widgets/footer.dart';
import 'package:sim/widgets/navbar.dart';
import 'package:sim/widgets/user_table.dart';

class PageDocuments extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text("Documents"),
      ),
      body: Padding(padding: EdgeInsets.all(5), child: Center(child: (UserTable()))),
      bottomNavigationBar: MyFooter(),

    );
  }
}