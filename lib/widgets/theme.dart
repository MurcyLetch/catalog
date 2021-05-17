import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  static ThemeData lightTheme (BuildContext context) =>ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: GoogleFonts.poppins().fontFamily,
        cardColor: Colors.white,
        canvasColor: creamcolor,
        buttonColor: darkbluishcolor,
        accentColor: Colors.black12,
        appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black),
          textTheme: Theme.of(context).textTheme,
        ),
        //primaryTextTheme: GoogleFonts.latoTextTheme(),
      );

  static ThemeData darkTheme (BuildContext context) =>ThemeData(
        
        brightness: Brightness.dark,
        cardColor: Colors.black,
        canvasColor: darkcreamcolor,
        buttonColor: lightbluishcolor,
        accentColor: Colors.white,
        fontFamily: GoogleFonts.poppins().fontFamily,
        appBarTheme: AppBarTheme(
          color: Colors.black,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.white),
          textTheme: Theme.of(context).textTheme
          .copyWith(headline6: context.textTheme.headline6.copyWith(color:Colors.white)),
        ),//primaryTextTheme: GoogleFonts.latoTextTheme(),
      );

  static Color creamcolor=Color(0xfff5f5f5);
  static Color darkcreamcolor=Vx.gray900;
  static Color darkbluishcolor=Color(0xff403b58);
  static Color lightbluishcolor=Vx.indigo500;
}