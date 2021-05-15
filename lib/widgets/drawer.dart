import 'package:flutter/cupertino.dart';
import'package:flutter/material.dart';
class Mydrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final imageURL=
    "https://s3.amazonaws.com/codechef_shared/sites/default/files/uploads/pictures/334b188cd3f98dc56255855be2b138ae.jpeg";
    return Drawer(
      child: Container(
        color:Colors.deepPurple,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            //header part begins
            DrawerHeader(
              padding: EdgeInsets.zero,
              child:UserAccountsDrawerHeader(
                accountName: Text('Arijit Indu'),
                accountEmail: Text('arijitindu99@gmail.com'),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(imageURL),
                  ),
              ), 
           ),
            //header part ends
            ListTile(
              leading: Icon(
                CupertinoIcons.home,
                color:Colors.white,
              ),
              title: Text(
                "Home",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white, 
                  ),
              )
              ),

            ListTile(
              leading: Icon(
                CupertinoIcons.profile_circled,
                color:Colors.white,
              ),
              title: Text(
                "Profile",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white, 
                  ),
              )
              ),

              ListTile(
              leading: Icon(
                CupertinoIcons.mail,
                color:Colors.white,
              ),
              title: Text(
                "Email me",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white, 
                  ),
              )
              ),
          ],
        ),
      ),
    );
  }
}