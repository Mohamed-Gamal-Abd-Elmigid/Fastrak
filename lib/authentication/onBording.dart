import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:loginscreen/authentication/signin.dart';
import 'package:loginscreen/authentication/signup.dart';

class OnBoarding extends StatefulWidget {
  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final int _numPages = 4;

  final PageController _pageController = PageController(initialPage: 0);

  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];

    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: isActive ? 12.0 : 6.0,
      width: isActive ? 12.0 : 6.0,
      decoration: BoxDecoration(
        border: Border.all(width: 4),
        color: isActive ? Colors.purple : Colors.black,
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Container(
            color: Color(0xFFF9FAFF),
            child: Column(
              children: [
                Image(
                  image: AssetImage('assets/logo.png'),
                  width: MediaQuery.of(context).size.width * 0.35,
                  height: MediaQuery.of(context).size.height * 0.066,
                ),
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.884,
                    height: MediaQuery.of(context).size.height * 0.650,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          blurRadius: 20.0, // soften the shadow
                          spreadRadius: 1.0,
                        ),
                      ],
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                      color: Color(0xFFFFFFFF),
                    ),
                    child: Column(
                      children: [
                        Container(
                          // color: Color.fromRGBO(249, 250, 255, 1),
                          height: MediaQuery.of(context).size.height * 0.600,
                          width: MediaQuery.of(context).size.width * 0.788,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                            color: Colors.white70,
                          ),
                          child: PageView(
                            physics: ClampingScrollPhysics(),
                            controller: _pageController,
                            onPageChanged: (int page) {
                              setState(() {
                                _currentPage = page;
                              });
                            },
                            children: [
                              Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(
                                      top: 25,
                                      left: 15,
                                      right: 15,
                                      bottom: 15,
                                    ),
                                    child: Image(
                                      image: AssetImage('assets/onboard.png'),
                                      // fit: BoxFit.contain,
                                    ),
                                  ),
                                  Text(
                                    'User-friendly',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    'From Registering An Account With'
                                    ' Fastrak To Tracking Your Parcel,'
                                    ' We Ensure A Friendly And Easy-To-Use '
                                    'Application.',
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(
                                      top: 25,
                                      left: 15,
                                      right: 15,
                                      bottom: 15,
                                    ),
                                    child: Image(
                                      image: AssetImage('assets/onboard.png'),
                                      // fit: BoxFit.contain,
                                    ),
                                  ),
                                  Text(
                                    'Screen Two',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    'From Registering An Account With'
                                    ' Fastrak To Tracking Your Parcel,'
                                    ' We Ensure A Friendly And Easy-To-Use '
                                    'Application.',
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(
                                      top: 25,
                                      left: 15,
                                      right: 15,
                                      bottom: 15,
                                    ),
                                    child: Image(
                                      image: AssetImage('assets/onboard.png'),
                                      // fit: BoxFit.contain,
                                    ),
                                  ),
                                  Text(
                                    'Screen Three',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    'From Registering An Account With'
                                    ' Fastrak To Tracking Your Parcel,'
                                    ' We Ensure A Friendly And Easy-To-Use '
                                    'Application.',
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(
                                      top: 25,
                                      left: 15,
                                      right: 15,
                                      bottom: 15,
                                    ),
                                    child: Image(
                                      image: AssetImage('assets/onboard.png'),
                                      // fit: BoxFit.contain,
                                    ),
                                  ),
                                  Text(
                                    'Screen Four',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    'From Registering An Account With'
                                    ' Fastrak To Tracking Your Parcel,'
                                    ' We Ensure A Friendly And Easy-To-Use '
                                    'Application.',
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 15,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: _buildPageIndicator(),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.44,
                  height: MediaQuery.of(context).size.height * 0.058,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.all<Color>(
                        // Color.fromRGBO(75, 0, 130, 210),
                        Colors.deepPurple.shade100,
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => SignUp(),
                        ),
                      );
                    },
                    child: Text(
                      'Skip',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0XFF4B0082),
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
