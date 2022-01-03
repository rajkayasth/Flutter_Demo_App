// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Material(
        color: Colors.white,
        child: Column(
          children: [
            Image.asset(
              "assets/images/login_image.png",
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20.0, child: Text('Hello'),),
            Text('Welcome',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
            SizedBox(height: 20.0,),
            Padding(padding: const EdgeInsets.all(16.0),
              child: Column(children: [
                TextFormField(decoration: InputDecoration(
                    hintText: 'Enter Username', labelText: 'Username'),),
                TextFormField(obscureText: true ,decoration: InputDecoration(
                  hintText: 'Enter Password', labelText: 'Password',),
                ),
                SizedBox(height: 20.0,),
                ElevatedButton(child: Text('LogIn'),onPressed: () {
                  print('Hi Codepur');
                },style: TextButton.styleFrom(),)
              ],
              ),
            )
          ],
        ));
  }
}

