import 'dart:convert';

import 'package:catalog/models/catalog.dart';
import 'package:catalog/utils/routes.dart';
import 'package:catalog/widgets/drawer.dart';
import 'package:catalog/widgets/home_widgets/catalog_header.dart';
import 'package:catalog/widgets/home_widgets/catalog_list.dart';
import 'package:catalog/widgets/item_widget.dart';
import 'package:catalog/widgets/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//it comes for rootBundle for fetching info from json placed in files

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
    void initState() {
      // ignore: todo
      // TODO: implement initState
      super.initState();
      loaddata();
    }
    loaddata() async {
      await Future.delayed(Duration(seconds:2));
      final catalogjson=await rootBundle.loadString("assets/files/catalog.json");//fetching the jason data into load data...imp one
      final decodeddata=jsonDecode(catalogjson);
      var productdata=decodeddata["products"];
      Catalogmodel.items=List.from(productdata).map<Item>((item)=>Item.fromMap(item)).toList();
      setState(() {});    //it recall the build method ....
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        // appBar: AppBar(
        //   title:Text("Catelog App"),
        // ),
        // body: Padding(
        //   padding: const EdgeInsets.all(16.0),
        //   child:(Catalogmodel.items!=null && Catalogmodel.items.isNotEmpty)
        //   ?GridView.builder(
        //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //       crossAxisCount: 2,//elements in one row
        //       mainAxisSpacing: 20,
        //       crossAxisSpacing: 20,
        //       ),//how many items will be there in a row..
        //     itemBuilder: (context,index){
        //       final item=Catalogmodel.items[index];
        //       return Card(
        //         clipBehavior: Clip.antiAlias,
        //         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        //         child: GridTile(
        //           header: Container(
        //             child: Text(item.name,
        //             style:TextStyle(
        //               color: Colors.white,
        //               )
        //               ),
        //             padding: const EdgeInsets.all(12),//make as compiler as compiler has not to initialise it again and again..
        //             decoration: BoxDecoration(
        //               color: Colors.deepPurple,
        //             ),
        //             ),
        //           child:Image.network(item.image),
        //           footer:Text(item.price.toString()),
        //           )
        //         );
        //     },
        //     itemCount: Catalogmodel.items.length,
        //     ) 
        //   :Center(
        //     child:CircularProgressIndicator(),
        //   ),
        // ),
        // drawer: Mydrawer(),
        backgroundColor: context.canvasColor,
      floatingActionButton: FloatingActionButton( //designing for cart button in home page
        onPressed: ()=>Navigator.pushNamed(context, MyRoutes.cartroute),
        backgroundColor: context.theme.buttonColor,
        child:Icon(CupertinoIcons.cart,color: Colors.white,),
      ),
      body: SafeArea(
        child: Container(
          padding: Vx.m32,//it gives padding of 32 from all sides
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,//it will start from left
            children: [
              Catalogheader(),
              if(Catalogmodel.items!=null && Catalogmodel.items.isNotEmpty)
                Cataloglist().py20().expand()
              else
                CircularProgressIndicator().centered().expand(),
          ],
          ),
        ),
      ),
      );
  }
}




// ListView.builder(
//             itemCount: Catalogmodel.items.length,
//             itemBuilder: (context,index){
//               return Itemwidget(
//                 item: Catalogmodel.items[index],//items will come according to the widgets
//                 );
//             },
//           )