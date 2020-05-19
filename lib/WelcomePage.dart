import 'package:annaflix/PrimePage.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:annaflix/HomePage.dart';


class WelcomePage extends StatefulWidget {
  static String id='welcome_screen';
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller=AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );
    controller.forward();
    controller.addListener(()
    {
      print(controller.value);
      if(controller.value==1.0)
      setState(() {
            Navigator.pushNamed(context, PrimePage.id);
      });
    });

  }
  @override
  Widget build(BuildContext context) {
    return Center(
        child:Image.asset('lib/assets/annaflixlogo.png'),

    );
  }
}
