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
import 'package:cloud_firestore/cloud_firestore.dart';


final _firestore=Firestore.instance;
FirebaseUser loggedInUser;
class Registration extends StatefulWidget {
  static String id='Registration';
  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> with TickerProviderStateMixin{
  GlobalKey<ScaffoldState> _scaffoldKey= new GlobalKey<ScaffoldState>();
  final _auth=FirebaseAuth.instance;
  String email;
  String password;
  String username;

  _showSnackBar(@required String message) {
    _scaffoldKey.currentState.showSnackBar(
      new SnackBar(
        backgroundColor: Colors.red[800],
        content: new Text(message),
        duration: new Duration(seconds: 2),
      ),
    );
  }

  void getCurrentUser () async{
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        loggedInUser = user;
        try {
          _firestore.collection("Users").document('${loggedInUser.uid}').setData({
            'username':username,
            'email':email,
            'profileimage': 'default',
            'watchedvideos' : 'default',
          });
        }
        catch (e) {
              print(e);
        }
      }
    }
    catch(e)
    {

      print(e);
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(

      ),
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
                        textAlign: TextAlign.start,
                        onChanged: (value)
                        {
                          //get the email id
                          username=value;
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
                          SizedBox(
                            width: 3,
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
                      if(username.isEmpty||email.isEmpty||password.isEmpty||!email.contains('@')||username==null||password==null)
                      {
                        _showSnackBar('Empty Fields or Bad Email format');
                      }
                      else
                        {
                          if(password.length<6)
                          {
                            _showSnackBar('Length of Password should be minimum 6 characters long');
                          }
                          else
                            {
                              try {
                                final user = await _auth.createUserWithEmailAndPassword(email: email.trim(), password: password);
                                if (user != null) {
                                  final FirebaseUser user = await _auth.currentUser();
                                  /*print("utsav"+ user.uid);*/
                                  getCurrentUser();
                                  Navigator.pushNamed(context,PrimePage.id);
                                }
                              }
                              catch(e)
                              {
                                _showSnackBar(e.toString().trim());
                                print(e);
                              }
                            }
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
