import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class Catalogimage extends StatelessWidget {
  final String image;

  const Catalogimage({Key key, @required this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Image.network(
            image
            ).box.p12.color(Colors.indigo[50]).roundedLg.make().p16().w40(context);
  }
}