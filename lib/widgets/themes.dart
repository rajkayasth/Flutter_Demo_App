import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme{
  static ThemeData  lightTheme (BuildContext context)=> ThemeData(
      cardColor: Colors.white,
      canvasColor: creamColor,
      buttonColor: darkBluishColor,
    primarySwatch: Colors.deepPurple,
      accentColor: darkBluishColor,
    fontFamily: GoogleFonts.poppins().fontFamily,
    appBarTheme: AppBarTheme(
      color: Colors.white,
      elevation: 0.0,
      iconTheme: IconThemeData(color: Colors.black),
      textTheme: Theme.of(context).textTheme,
    ));
  static ThemeData  darkTheme (BuildContext context)=> ThemeData(
    brightness: Brightness.dark,
    cardColor: Colors.black,
      canvasColor: DarkcreamColor,
      buttonColor: lightBluishColor,
      primarySwatch: Colors.deepPurple,
      accentColor: Colors.white,
      fontFamily: GoogleFonts.firaSans().fontFamily,
      appBarTheme: AppBarTheme(
        //color: Colors.black,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.white),
        textTheme: Theme.of(context).textTheme.copyWith(
            headline6:
            context.textTheme.headline6!.copyWith(color: Colors.white),),
      )
     );
  static Color creamColor = Color(0xfff5f5f5);
  static Color DarkcreamColor = Vx.gray900;
  static Color darkBluishColor = Color(0xff403b58);
  static Color lightBluishColor = Vx.indigo500;
}