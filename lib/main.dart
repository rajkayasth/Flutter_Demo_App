import 'package:flutter/material.dart';
import 'package:flutter_second_app/Pages/home_page.dart';
import 'package:flutter_second_app/Pages/login_page.dart';
import 'package:flutter_second_app/Utils/routes.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //home: HomePage(),
      theme: ThemeData(primarySwatch: Colors.deepOrange,
      fontFamily: GoogleFonts.lato().fontFamily),
      themeMode: ThemeMode.dark,
      routes: {
        '/' : (context) => LoginPage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.homeRoute: (context) => HomePage()
      },
    );
  }
}
