import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 8),
        child: ListView(
          physics: ClampingScrollPhysics(),
          children: <Widget>[
            //Container top barre AppBar
            Container(
              margin: EdgeInsets.only(left: 16, right: 16, top: 16),
              child: Row(
                //espace entre menu et profil
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: <Widget>[
                   GestureDetector(
                     onTap: (){
                       print('Drawer Tapped');
                     },
                     child : SvgPicture.asset('assets/svg/drawer_icon.svg'),
                   ),
                   Container(
                     height: 59,
                     width: 59,
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(50),
                       image: DecorationImage(image: AssetImage('assets/images/user_image.png'))
                     ),
                   )
                 ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
