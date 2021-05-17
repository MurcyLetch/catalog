import 'package:catalog/widgets/theme.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
class Catalogheader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
            crossAxisAlignment: CrossAxisAlignment.start,//it will start from left
            children: [
              "Catalog App".text.xl5.bold.color(MyTheme.darkbluishcolor).make(),
              "Trending Products".text.xl2.make(),
          ],
          );
  }
}