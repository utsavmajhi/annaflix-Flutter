import 'package:annaflix/WelcomePage.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:annaflix/HomePage.dart';

class PrimePage extends StatefulWidget {
  static String id='PrimePage';
  @override
  _AnnaFlixTabBarState createState() => _AnnaFlixTabBarState();
}

class _AnnaFlixTabBarState extends State<PrimePage> {
  int _page = 2;
  GlobalKey _bottomNavigationKey = GlobalKey();

  final _pageOptions=[

    Center( child: Text("Page 2")),//for search
    Center( child: Text("Page 3"),),
    HomePage(),
    Center( child: Text("Page 4")),
    Center( child: Text("Page 5")),

  ];


  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
          brightness: Brightness.dark
      ),
      child: Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          color: Colors.black,
          backgroundColor:Colors.grey[850] ,
          height: 50,
          items: <Widget>[
            Icon(Icons.search, size: 30,color: Colors.white,),
            Icon(Icons.list, size: 30,color: Colors.white,),
            Icon(Icons.home, size: 30,color: Colors.white,),
            Icon(Icons.mail,size:30,color: Colors.white,),
            Icon(Icons.person_pin,size:30,color: Colors.white,)
          ],
          index: 2,//initial home page
          onTap: (index) {
            //Handle button tap
            setState(() {
              _page = index;
            });
          },
        ),
        body:_pageOptions[_page],
      ),
    );
  }
}
