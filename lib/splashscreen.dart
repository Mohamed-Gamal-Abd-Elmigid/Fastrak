import 'package:flutter/material.dart';
import 'package:loginscreen/newSignUp.dart';
import 'package:loginscreen/onBording.dart';
import 'package:loginscreen/signin.dart';
import 'package:loginscreen/signup.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

class splashScreen extends StatefulWidget {
  @override
  _splashScreenState createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
  Widget build(BuildContext context) {
    return SplashScreenView(
      imageSrc: "assets/splash.png",
      home: newSignUp(),
      duration: 4,
      backgroundColor: Colors.purple,
      imageSize: 30,
    );
  }
}
