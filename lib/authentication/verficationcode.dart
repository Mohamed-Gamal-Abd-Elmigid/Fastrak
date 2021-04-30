import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loginscreen/Home.dart';
import 'package:loginscreen/authentication/newpassword.dart';
import 'package:loginscreen/authentication/splashscreen.dart';
import 'package:loginscreen/viewmodel/userviewmodel.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splashscreen/splashscreen.dart';

class VerficationCode extends StatefulWidget {
  String phoneNumber;
  String password;
  VerficationCode({this.phoneNumber, this.password});
  @override
  _VerficationCodeState createState() => _VerficationCodeState();
}

class _VerficationCodeState extends State<VerficationCode>
    with SingleTickerProviderStateMixin {
  String phoneNumber;
  String password;

  _VerficationCodeState({this.phoneNumber, this.password});

  final otpKey = GlobalKey<FormState>();

  TextEditingController firstNumber = TextEditingController();
  TextEditingController secondNumber = TextEditingController();
  TextEditingController thirdNumber = TextEditingController();
  TextEditingController fourNumber = TextEditingController();
  TextEditingController fiveNumber = TextEditingController();
  // AnimationController _timerController;
  Animation _animation;
  FocusNode pin2FocusNode;
  FocusNode pin3FocusNode;
  FocusNode pin4FocusNode;
  FocusNode pin5FocusNode;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    startTimer();
    getPref();
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
    pin5FocusNode = FocusNode();
  }

  Timer _timer;
  int _start = 20;

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  void startNewTimer() {
    _start = 20;
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  clearPin() {}

  @override
  void dispose() {
    // TODO: implement dispose
    _timer.cancel();
    pin2FocusNode.dispose();
    pin3FocusNode.dispose();
    pin4FocusNode.dispose();
    pin5FocusNode.dispose();

    super.dispose();
  }

  void nextField({String value, FocusNode focusNode}) {
    if (value.length == 1) {
      focusNode.requestFocus();
    }
  }

  formOtp() {
    return Form(
      key: otpKey,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 50,
            height: 60,
            child: TextFormField(
              textInputAction: TextInputAction.next,
              controller: firstNumber,
              autofocus: true,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              style: TextStyle(
                fontSize: 24,
              ),
              decoration: InputDecoration(
                hintText: '_',
                errorStyle: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                ),
                enabledBorder: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                  ),
                ),
              ),
              onChanged: (value) {
                nextField(value: value, focusNode: pin2FocusNode);
              },
              validator: (value) {
                if (value.isEmpty) return "Required";
              },
            ),
          ),
          SizedBox(
            width: 50,
            height: 60,
            child: TextFormField(
              textInputAction: TextInputAction.next,
              controller: secondNumber,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              style: TextStyle(
                fontSize: 24,
              ),
              decoration: InputDecoration(
                hintText: "_",
                errorStyle: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                ),
                enabledBorder: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                  ),
                ),
              ),
              focusNode: pin2FocusNode,
              onChanged: (value) {
                nextField(value: value, focusNode: pin3FocusNode);
              },
              validator: (value) {
                if (value.isEmpty) return "Required";
              },
            ),
          ),
          SizedBox(
            width: 50,
            height: 60,
            child: TextFormField(
              textInputAction: TextInputAction.next,
              controller: thirdNumber,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              style: TextStyle(
                fontSize: 24,
              ),
              decoration: InputDecoration(
                hintText: "_",
                errorStyle: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                ),
                enabledBorder: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                  ),
                ),
              ),
              focusNode: pin3FocusNode,
              onChanged: (value) {
                nextField(value: value, focusNode: pin4FocusNode);
              },
              validator: (value) {
                if (value.isEmpty) return "Required";
              },
            ),
          ),
          SizedBox(
            width: 50,
            height: 60,
            child: TextFormField(
              textInputAction: TextInputAction.next,
              controller: fourNumber,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              style: TextStyle(
                fontSize: 24,
              ),
              decoration: InputDecoration(
                hintText: "_",
                errorStyle: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                ),
                enabledBorder: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                  ),
                ),
              ),
              focusNode: pin4FocusNode,
              onChanged: (value) {
                nextField(value: value, focusNode: pin5FocusNode);
              },
              validator: (value) {
                if (value.isEmpty) return "Required";
              },
            ),
          ),
          SizedBox(
            width: 50,
            height: 60,
            child: TextFormField(
              textInputAction: TextInputAction.done,
              controller: fiveNumber,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              style: TextStyle(
                fontSize: 24,
              ),
              decoration: InputDecoration(
                hintText: "_",
                errorStyle: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                ),
                enabledBorder: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                  ),
                ),
              ),
              focusNode: pin5FocusNode,
              onChanged: (value) {
                pin5FocusNode.unfocus();
              },
              validator: (value) {
                if (value.isEmpty) return "Required";
              },
            ),
          ),
        ],
      ),
    );
  }

  String phone;

  String token;

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    phone = preferences.getString("phone");
    token = preferences.getString("token");
    print("Token From Verfication  OTP Code ");
    print(token);
    print("----------------");
  }

  @override
  Widget build(BuildContext context) {
    final phoneKey = GlobalKey<FormState>();

    String value;

    var _blankFocusNode = new FocusNode();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(_blankFocusNode);
          },
          child: SafeArea(
            child: Center(
              child: Container(
                color: Color(0xFFF9FAFF),
                child: Column(
                  children: [
                    Image(
                      image: AssetImage(
                        'assets/logo.png',
                      ),
                      width: MediaQuery.of(context).size.width * 0.35,
                      height: MediaQuery.of(context).size.height * 0.066,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.884,
                      height: MediaQuery.of(context).size.height * 0.760,
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
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.only(
                                top: 25,
                                left: 25,
                                right: 25,
                                bottom: 15,
                              ),
                              child: Image(
                                image: AssetImage('assets/verf.png'),
                                // fit: BoxFit.contain,
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height / 20,
                                  child: Text(
                                    'VERFICATION CODE',
                                    style: TextStyle(
                                      fontFamily: 'SegoeUI',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24,
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 4.0,
                                  width: MediaQuery.of(context).size.width / 7,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                    color: Colors.black,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: 20,
                                    left: 10,
                                    right: 10,
                                  ),
                                  child: Text(
                                    'Code has been sent to ${phoneNumber}',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 10, right: 10, bottom: 10),
                                  child: Text(
                                    'Enter the code belw to continue',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "0.$_start",
                                      style: TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        print("HEllo");
                                        startNewTimer();
                                        Provider.of<UserViewModel>(
                                          context,
                                          listen: false,
                                        ).resendOtp(token);
                                      },
                                      child: Text(
                                        " Resend",
                                        style: TextStyle(
                                          color: Color(0xFF0FFCE93D8),
                                          fontSize: 26,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 20,
                                  ),
                                  child: formOtp(),
                                ),
                              ],
                            ),

                            SizedBox(
                              width: MediaQuery.of(context).size.width / 1.7,
                              height: 60,
                              child: ElevatedButton(
                                onPressed: () async {
                                  if (!otpKey.currentState.validate()) {
                                    print("Error Format");
                                  } else {
                                    var sendOTP =
                                        "${firstNumber.text}${secondNumber.text}${thirdNumber.text}${fourNumber.text}${fiveNumber.text}";

                                    bool result =
                                        await Provider.of<UserViewModel>(
                                      context,
                                      listen: false,
                                    ).OTP(
                                      "123456",
                                      token,
                                    );
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => Home(),
                                      ),
                                    );
                                  }
                                },
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                    Color(0xFF4B0082),
                                  ),
                                ),
                                child: Text(
                                  'Confirm',
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),

                            Padding(
                              padding: EdgeInsets.only(
                                  bottom:
                                      MediaQuery.of(context).viewInsets.bottom),
                            ),
                            // SizedBox(
                            //   height: 20,
                            // ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
