import 'package:annaflix/PrimePage.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:annaflix/HomePage.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:google_fonts/google_fonts.dart';

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
      duration: Duration(seconds: 5),
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
    return Scaffold(
      backgroundColor: Colors.black54,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Image.asset('lib/assets/annaflixlogo.png'),
          SizedBox(
            height: 1,
          ),
          Center(
            child: TypewriterAnimatedTextKit(
              speed: Duration(milliseconds: 400),
              text:['World Of Animes'],
              textStyle: GoogleFonts.vollkorn(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          )
       ],
      ),
    );
  }
}
