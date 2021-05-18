import 'package:catalog/core/store.dart';
import 'package:catalog/models/cartmodel.dart';
import 'package:catalog/widgets/theme.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';


class Cartpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.make(),
      ),

      body: Column(children: [
        _Cartlist().p32().expand(),
        Divider(),
        _Carttotal(),
      ],),
    );
  }
}

class _Carttotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Cartmodel _cart=(VxState.store as Mystore).cart;
    //final _cart=Cartmodel();
    return SizedBox(
      height: 200,
      child:Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          VxConsumer( //we want to rebuild the price section not the whole page so use it..
            notifications: {},//otherwise we could use VxState
            mutations: {Removemutation},
            builder:(context,_){
              return "\$${_cart.totalprice}".text.xl5.color(context.theme.accentColor).make();
            }
          ),
          30.widthBox,
          ElevatedButton(
            onPressed: (){
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:"Buy isn't supported yet".text.make()));
            },
            style: ButtonStyle(backgroundColor:MaterialStateProperty.all(context.theme.buttonColor)),
            child: "Buy".text.white.make(),
          ).w32(context)
        ],
      )
    );
  }
}
//we need to use it as stateful widget as thre will be a option to remove
class _Cartlist extends StatelessWidget{
  //final _cart=Cartmodel();
  final Cartmodel _cart=(VxState.store as Mystore).cart;
  @override
  Widget build(BuildContext context) {//whenever we remove any thing we need to redraw the
   VxState.listen(context,to:[Removemutation]);//used to rebuild the widget tree
   final Cartmodel _cart=(VxState.store as Mystore).cart;
   return _cart.items.isEmpty?"Nothing to show".text.xl3.makeCentered():ListView.builder(
      itemCount: _cart.items.length,      
      itemBuilder: (context,index)=>ListTile(
        leading: Icon(Icons.done),
        trailing: IconButton(icon:Icon(Icons.remove_circle_outline),
        onPressed: (){
          //_cart.remove(_cart.items[index]);
          Removemutation(_cart.items[index]);
          //setState(() {});
        },
        ),
        title: _cart.items[index].name.text.make(),
      ),
    );
  }
}