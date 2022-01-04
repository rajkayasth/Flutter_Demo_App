import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    String name = 'UserName';
    String email = 'Email_ID';
    final imageURL = 'https://avatarfiles.alphacoders.com/108/108886.gif';
    return Drawer(
      child: Container(
        color: Colors.deepPurple,
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            DrawerHeader(padding: const EdgeInsets.all(0),
                child: UserAccountsDrawerHeader(
                  margin: const EdgeInsets.all(0),
                  accountName: Text('$name   -  Raj Kayasth',style: const TextStyle(fontWeight: FontWeight.bold),),
                  accountEmail: Text('$email -    Raj@gmail.com',style: const TextStyle(fontWeight: FontWeight.bold),),
                  currentAccountPicture: CircleAvatar(backgroundImage: NetworkImage(imageURL) ,),)),
            ListTile(
              title: Text('Home',textScaleFactor: 1.3,style: TextStyle(color: Colors.white,),textAlign : TextAlign.left,)
              ,leading: Icon(CupertinoIcons.home,color: Colors.white,),),
            ListTile(
              title: Text('Profile',textScaleFactor: 1.3,style: TextStyle(color: Colors.white,),textAlign : TextAlign.left,)
              ,leading: Icon(CupertinoIcons.profile_circled,color: Colors.white,),)
          ],
        ),
      ),
    );
  }
}
