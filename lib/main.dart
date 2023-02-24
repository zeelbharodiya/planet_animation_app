import 'package:flutter/material.dart';
import 'package:planet_animation_app/views/screens/homepage.dart';
import 'package:planet_animation_app/views/screens/homepage1.dart';


void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/' : (context)  => HomePage(),
        'HomePage1' : (context)  => HomePage1(),
      },
    ),
  );
}