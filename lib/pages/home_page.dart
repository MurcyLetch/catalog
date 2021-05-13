import 'package:flutter/material.dart';
class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int days=30;
    var name="arijit";
    return Scaffold(
        appBar: AppBar(
          title:Text("Catelog App"),
        ),
        body: Center(
          child: Container(
            child: Text("Welcome to $days of code by $name"),
          ),
        ),
        drawer: Drawer(),
      );
  }
}