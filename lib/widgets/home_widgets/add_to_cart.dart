import 'package:catalog/core/store.dart';
import 'package:catalog/models/cartmodel.dart';
import 'package:catalog/models/catalog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class addtocart extends StatelessWidget {
  final Item catalog;
  addtocart({
    Key key,this.catalog,
  }) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    VxState.listen(context,to:[Addmutation,Removemutation]);//need to rebuild bwe cant use setstate as it is a stateless widget
    final Cartmodel _cart=(VxState.store as Mystore).cart;
    // final Catalogmodel _catalog=(VxState.store as Mystore).catalog;

    bool isincart=_cart.items.contains(catalog)??false;
    return ElevatedButton(
      onPressed: (){
        if(!isincart){
        // isincart=isincart.toggle();
        //final _catalog=Catalogmodel();
        
        // _cart.catalog=_catalog;
        // _cart.add(catalog);
        Addmutation(catalog);
        // setState(() {});
        }
      },
       style:ButtonStyle(
         backgroundColor: MaterialStateProperty.all(
           context.theme.buttonColor
         ),
         shape:MaterialStateProperty.all(StadiumBorder()),
       ) ,
       child: isincart?Icon(Icons.done) : "+ Cart".text.make(),
    );
  }
}