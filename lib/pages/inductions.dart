import 'package:flutter/material.dart';
import 'package:sim/widgets/footer.dart';
import 'package:sim/widgets/induction_table.dart';
import 'package:sim/widgets/navbar.dart';


class PageInductions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text("Inductions"),
      ),
      body: Padding(padding: EdgeInsets.all(5), child: Center(child: (InductTable()))),
      bottomNavigationBar: MyFooter(),

    );
  }
}