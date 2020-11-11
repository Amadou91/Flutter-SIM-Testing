import 'package:flutter/material.dart';

class MyFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 150,
        color: Colors.grey,
        child: FittedBox(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
              Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                Image(image: AssetImage('assets/images/engdoc-logo-1.png')),
              ]),
              Column(mainAxisAlignment: MainAxisAlignment.center, children: [Container(width: 50)]),
              Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                Row(children: [
                  Text('Engineering Documentation Ltd',
                      style: TextStyle(fontSize: 12), textAlign: TextAlign.left),
                ]),
                Row(children: [
                  Text('Stamullen, Co. Meath, Ireland 1st Floor, Westward Town Centre,',
                      style: TextStyle(fontSize: 12), textAlign: TextAlign.left),
                ]),
                Row(children: [
                  Text('+353 71 9141564 | info@engdoc.ie | www.engdoc.ie',
                      style: TextStyle(fontSize: 12), textAlign: TextAlign.left),
                ]),
              ]),
            ])));
  }
}
