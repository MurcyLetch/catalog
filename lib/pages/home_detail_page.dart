import 'package:catalog/models/catalog.dart';
import 'package:catalog/widgets/theme.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
class Homedetailpage extends StatelessWidget {
  final Item catalog;

  const Homedetailpage({Key key,@required this.catalog}) : 
  assert (catalog!=null),
  super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:(
          Colors.transparent
          ),
      ),
      backgroundColor:context.canvasColor,
      bottomNavigationBar:ButtonBar( //comes from left to right
                alignment: MainAxisAlignment.spaceBetween,
                children: [
                  "\$${catalog.price}".text.extraBold.xl4.make(),
                  ElevatedButton(
                    onPressed: (){},
                     style:ButtonStyle(
                       backgroundColor: MaterialStateProperty.all(context.theme.buttonColor),
                       shape:MaterialStateProperty.all(StadiumBorder()),
                     ) ,
                     child: "Add to Cart".text.xl.make(),
                  ).wh(130, 50)
                ],
              ).p16().backgroundColor(context.cardColor),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag: Key(catalog.id.toString()),//we need to use hero for this animation...key should be same
              child: Image.network(catalog.image)
              ).h40(context),

              Expanded(
                child: VxArc(
                  height: 30.0,
                  arcType: VxArcType.CONVEY,
                  edge:VxEdge.TOP,
                  child: Container(
                    color: context.cardColor,
                    width:context.screenWidth,
                    child: Column(
                      children: [
                        catalog.name.text.xl4.color(context.accentColor).bold.make(), //name
                        catalog.desc.text.textStyle(context.captionStyle).xl.make(),//desc
                        "dfcdsahfgavfghjfd fjhdafd fadf ufydaufyuayf adufydaufyudayfudayf dauyfudayfuday fuodas fudaytudayfudayfudaf"
                        .text.textStyle(context.captionStyle)
                        .make().p16()
                      ],
                    ).py64(),
                  ),
                ))
          ],
        ),
      ) ,
    );
  }
}