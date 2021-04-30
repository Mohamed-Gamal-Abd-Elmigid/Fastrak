import 'package:flutter/material.dart';
import 'package:loginscreen/authentication/newSignUp.dart';
import 'package:loginscreen/authentication/onBording.dart';
import 'package:loginscreen/authentication/signin.dart';
import 'package:loginscreen/authentication/signup.dart';
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
