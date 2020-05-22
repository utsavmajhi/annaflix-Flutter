import 'package:annaflix/LoginPage.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:annaflix/PrimePage.dart';
import 'package:annaflix/HomePage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:annaflix/constants.dart';
import 'package:annaflix/rounded_button.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Registration extends StatefulWidget {
  static String id='Registration';
  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> with TickerProviderStateMixin{
  final _auth=FirebaseAuth.instance;
  String email;
  String password;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: Center(
        child: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              Positioned(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Registration',
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
                          email=value;
                        },
                        style: TextStyle(
                            color: Colors.white54
                        ),
                        decoration: klogintextfieldstyle.copyWith(hintText: 'Name'),

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
                          email=value;
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
                          //get the pass
                          password=value;
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
                    RoundedButton(title:'Sign Up',colour: Colors.white38,onPressed:()async{
                      //backend starts for checking login credentials
                      setState(() {

                      });

                      try {
                        final user = await _auth.createUserWithEmailAndPassword(email: email.trim(), password: password);
                        if (user != null) {
                          final FirebaseUser user = await _auth.currentUser();
                          print("utsav"+ user.uid);
                          Navigator.pushNamed(context,PrimePage.id);
                        }
                      }
                      catch(e)
                      {
                        print(e);
                      }
                    } ),
                  ],
                ),
              ),
            ],

          ),
        ),
      ),
    );
  }
}
