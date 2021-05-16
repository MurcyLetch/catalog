import 'dart:convert';

import 'package:catalog/models/catalog.dart';
import 'package:catalog/widgets/drawer.dart';
import 'package:catalog/widgets/item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';//it comes for rootBundle for fetching info from json placed in files
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
      final catalogjson=await rootBundle.loadString("assets/files/catalog.json");//fetching the jason data into load data...imp one
      final decodeddata=jsonDecode(catalogjson);
      var productdata=decodeddata["products"];
      print(productdata);
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:Text("Catelog App"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView.builder(
            itemCount: Catelogmodel.items.length,
            itemBuilder: (context,index){
              return Itemwidget(
                item: Catelogmodel.items[index],//items will come according to the widgets
                );
            },
          ),
        ),
        drawer: Mydrawer(),
      );
  }
}