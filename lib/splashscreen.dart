import 'package:flutter/material.dart';
import 'package:loginscreen/onBording.dart';
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
      home: OnBoarding(),
      duration: 4,
      backgroundColor: Colors.purple,
      imageSize: 30,
    );
  }
}
