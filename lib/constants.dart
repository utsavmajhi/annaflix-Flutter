import 'package:annaflix/LoginPage.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:annaflix/HomePage.dart';
import 'package:google_fonts/google_fonts.dart';

const klogintextfieldstyle =InputDecoration(
  hintText: 'Enter Value',
  hintStyle:TextStyle(
    color:Color(0xFF6B6B6B),
  ),
  contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),

  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.transparent),
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.transparent),
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
  filled: true,
  fillColor: Color(0xFF1B1C1B),
);