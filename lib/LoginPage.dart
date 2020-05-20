import 'package:annaflix/LoginPage.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:annaflix/HomePage.dart';
import 'package:google_fonts/google_fonts.dart';
class LoginPage extends StatefulWidget {
  static String id='LoginPage';
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<LoginPage> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller=AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
    );
    controller.forward();
    controller.addListener(()
    {
      print(controller.value);
      if(controller.value==1.0)
        setState(() {

        });
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // backgroundColor: Colors.black54,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            'Ohayo!',
            style: GoogleFonts.bebasNeue(
                  fontSize: 32,
              color: Colors.redAccent,
            ),
          ),

          TextField(
            keyboardType: TextInputType.emailAddress,

            textAlign: TextAlign.center,
            onChanged: (value)
            {
                  //get the email id
            },
            decoration: InputDecoration(
              hintText: 'Email Address',
                hintStyle:TextStyle(
                  color:Colors.blueGrey,
                ),
              contentPadding:
              EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0)),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
                borderRadius: BorderRadius.all(Radius.circular(32.0)),
              ),
            ),

          ),

        ],
      ),
    );
  }
}
