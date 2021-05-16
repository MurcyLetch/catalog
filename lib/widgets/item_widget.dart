import 'package:catalog/models/catalog.dart';
import 'package:flutter/material.dart';
class Itemwidget extends StatelessWidget {
  final Item item;

  const Itemwidget({Key key, @required this.item}) 
  :assert(item!=null) ,
  super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card( //card widget
      //elevation: 0.0,
      shape: StadiumBorder(),
      child: ListTile(   //we have already used it in drawer portion
        onTap: (){
          print("${item.name} pressed");
        },
        leading: Image.network(item.image),//image at left
        title: Text(item.name),
        subtitle: Text(item.desc),
        trailing: Text(
          "\$ ${item.price}",
          style: TextStyle(
            color:Colors.deepPurple,
            fontWeight: FontWeight.bold,
            ),
          ),//it comes to the right side
      ),
    );
  }
}