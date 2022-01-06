// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_second_app/Utils/routes.dart';
import 'package:velocity_x/src/extensions/context_ext.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name='';
  bool changeButton = false;
  final _formKey = GlobalKey<FormState>();
  moveToHome(BuildContext context) async{
    if(_formKey.currentState!.validate()) {

      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Material(
        color: context.canvasColor,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Image.asset(
                  "assets/images/heya.png",
                  fit: BoxFit.cover,

                ),
                SizedBox(height: 20.0,),
                Text('Welcome $name',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                SizedBox(height: 20.0,),
                Padding(padding: const EdgeInsets.symmetric(vertical: 16.0,horizontal: 32.0),
                  child: Column(children: [
                    TextFormField( validator: (value){
                      if(value!.isEmpty){
                        return 'Username Cannot be empty!!!';
                      }return null;
                    },
                      onChanged: (value){
                        name = value;
                        setState(() {
                        });
                    },decoration: InputDecoration(
                        hintText: 'Enter Username', labelText: 'Username'),),
                    TextFormField(validator: (value){
                      if(value!.isEmpty){
                        return 'Password cannot be empty!!';
                      }else if(value.length <6){
                        return 'Password length Should be atleast 6';
                      }return null;
                    }
                      ,obscureText: true ,decoration: InputDecoration(
                      hintText: 'Enter Password', labelText: 'Password',),
                    ),
                    SizedBox(height: 40.0,),
                    Material(
                      color:  context.theme.buttonColor ,
                      child: InkWell(
                        onTap: () => moveToHome(context),
                        child: AnimatedContainer(
                          duration: Duration(seconds: 1),
                          width: changeButton? 50 : 150,
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
          ),
        ));
  }
}

