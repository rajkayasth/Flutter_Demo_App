// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_second_app/Utils/routes.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name='';
  bool changeButton = false;
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Material(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                "assets/images/heya.png",
                fit: BoxFit.cover,

              ),
              SizedBox(height: 20.0, child: Text('Hello'),),
              Text('Welcome $name',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
              SizedBox(height: 20.0,),
              Padding(padding: const EdgeInsets.all(16.0),
                child: Column(children: [
                  TextFormField(onChanged: (value){
                      name = value;
                      setState(() {
                      });
                  },decoration: InputDecoration(
                      hintText: 'Enter Username', labelText: 'Username'),),
                  TextFormField(obscureText: true ,decoration: InputDecoration(
                    hintText: 'Enter Password', labelText: 'Password',),
                  ),
                  SizedBox(height: 40.0,),
                  /*ElevatedButton(child: Text('LogIn'),onPressed: () {
                    Navigator.pushNamed(context, MyRoutes.homeRoute);
                  },style: TextButton.styleFrom(minimumSize: Size(150, 40)),)*/
                  Material(
                    color:  Colors.deepPurpleAccent,
                    child: InkWell(
                      onTap: () async {
                        setState(() {
                          changeButton = true;
                        });
                        await Future.delayed(Duration(seconds: 1));
                        //Navigator.pushNamed(context, MyRoutes.homeRoute);
                      },
                      child: AnimatedContainer(
                        duration: Duration(seconds: 1),
                        width: changeButton? 100 : 150,
                        height: 50,
                        alignment: Alignment.center,
                        child: changeButton ? Icon(Icons.done, color: Colors.white,) : Text('Login',style: TextStyle(color: Colors.white,
                        fontWeight: FontWeight.bold, fontSize: 18),)
                      ),
                    ),
                  )
                ],
                ),
              )
            ],
          ),
        ));
  }
}

