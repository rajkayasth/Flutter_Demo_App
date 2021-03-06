import 'package:flutter/material.dart';
import 'package:flutter_second_app/Core/Store.dart';
import 'package:flutter_second_app/Pages/cart_page.dart';
import 'package:flutter_second_app/Pages/home_page.dart';
import 'package:flutter_second_app/Pages/login_page.dart';
import 'package:flutter_second_app/Utils/routes.dart';
import 'package:flutter_second_app/widgets/themes.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

void main() {
  runApp(VxState(store: MyStore(),
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //home: HomePage(),
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      debugShowCheckedModeBanner: false,
      initialRoute: MyRoutes.homeRoute ,
      routes: {
        '/' : (context) => LoginPage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.cartRoute: (context) => CartPage(),
      },
    );
  }
}
