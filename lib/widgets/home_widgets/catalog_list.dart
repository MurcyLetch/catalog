import 'package:catalog/models/catalog.dart';
import 'package:catalog/pages/home_detail_page.dart';
import 'package:catalog/widgets/theme.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'catalog_image.dart';

class Cataloglist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: Catalogmodel.items.length,
      itemBuilder: (context,index){
        final catalog=Catalogmodel.getbypossition(index) ;
        return InkWell(
          onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>Homedetailpage(catalog: catalog,))),
          child: Catalogitems(catalog:catalog)
          );
      },
    );
  }
}
class Catalogitems extends StatelessWidget {
  final Item catalog;

  const Catalogitems({Key key,@required this.catalog}) :assert(catalog!=null),
   super(key: key);
  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          Hero(
            tag: Key(catalog.id.toString()),
            child: Catalogimage(
              image: catalog.image
              ),
          ),
          Expanded(child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              catalog.name.text.lg.color(context.accentColor).bold.make(),
              catalog.desc.text.textStyle(context.captionStyle).make(),
              ButtonBar( //comes from left to right
                alignment: MainAxisAlignment.spaceBetween,
                children: [
                  "\$${catalog.price}".text.extraBold.xl.make(),
                  ElevatedButton(
                    onPressed: (){},
                     style:ButtonStyle(
                       backgroundColor: MaterialStateProperty.all(
                         context.theme.buttonColor
                       ),
                       shape:MaterialStateProperty.all(StadiumBorder()),
                     ) ,
                     child: "+ Cart".text.make(),
                  )
                ],
              )
            ],
          ) 
          
          )
        ],
      )
    ).color(context.cardColor).roundedLg.square(150).make().py16();
  }
}