import 'package:annaflix/WelcomePage.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:annaflix/HomePage.dart';
import 'package:annaflix/PrimePage.dart';
import 'package:annaflix/LoginPage.dart';

void main() => runApp(AnnaFlix());

class AnnaFlix extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AnnaFlix',
      theme: ThemeData(
        primaryColor: Colors.black,
      ),
      initialRoute:WelcomePage.id,
      routes: {
        WelcomePage.id:(context) => WelcomePage(),
        LoginPage.id:(context) => LoginPage(),
        PrimePage.id:(context) => PrimePage(),
        HomePage.id:(context) => HomePage(),


      },
    );
  }
}
