import 'package:catalog/pages/cart.dart';
import 'package:catalog/pages/home_page.dart';
import 'package:catalog/pages/login_page.dart';
import 'package:catalog/utils/routes.dart';
import 'package:catalog/widgets/theme.dart';
import'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //home: HomePage(),
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      debugShowCheckedModeBanner: false,
      //initialRoute: "/home",//we can use anything which we want to show as the home page
      routes: {
       "/": (context)=>HomePage(),//LoginPage()
       MyRoutes.homeroute:(context)=>HomePage(),
       MyRoutes.loginroute:(context)=>LoginPage(),
       MyRoutes.cartroute:(context)=>Cartpage(),
      },
    );
  }
}