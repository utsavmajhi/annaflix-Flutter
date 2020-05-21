import 'package:annaflix/LoginPage.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:annaflix/HomePage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:annaflix/constants.dart';
import 'package:annaflix/rounded_button.dart';

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
      backgroundColor: Colors.black54,
      body: Stack(
        children: <Widget>[
          Positioned(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Ohayo!',
                  style: GoogleFonts.bebasNeue(
                    fontSize: 60,
                    color: Colors.redAccent,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.only(left: 10,right: 10),
                  child: TextField(
                    cursorColor: Color(0xFF6B6B6B),
                    keyboardType: TextInputType.emailAddress,
                    textAlign: TextAlign.start,
                    onChanged: (value)
                    {
                      //get the email id
                    },
                    style: TextStyle(
                      color: Colors.white54
                    ),
                    decoration: klogintextfieldstyle.copyWith(hintText: 'Email'),

                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  padding: EdgeInsets.only(left: 10,right: 10),
                  child: TextField(
                    cursorColor: Color(0xFF6B6B6B),
                    obscureText: true,
                    textAlign: TextAlign.start,
                    onChanged: (value)
                    {
                      //get the email id
                    },
                    style: TextStyle(
                        color: Colors.white54
                    ),
                    decoration: klogintextfieldstyle.copyWith(hintText: 'Password'),

                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left:15,top:15,right: 24,bottom: 15),
                  child: Row(

                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        'Forgot Password?',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15
                        ),
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      GestureDetector(
                        onTap: (){
                          //if clicked on recover password

                        },
                        child: Text(
                          'Recover here',
                          style: TextStyle(
                            color: Colors.redAccent,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                RoundedButton(title:'Log In',colour: Colors.white38,onPressed:(){
                  //backend starts for checking login credentials

                } ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,

            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Don\'t have an account?',
                    style: TextStyle(
                      color:Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  GestureDetector(
                    onTap: (){

                    },
                    child: Text(
                      'Sign Up here',
                      style: TextStyle(
                        color: Colors.redAccent,
                        fontSize: 16,

                      ),
                    ),
                  )
                ],
              ),
            ],
          )
        ],

      ),
    );
  }
}
