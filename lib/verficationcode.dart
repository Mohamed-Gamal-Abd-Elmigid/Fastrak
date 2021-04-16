import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loginscreen/newpassword.dart';
import 'package:loginscreen/splashscreen.dart';
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

class _VerficationCodeState extends State<VerficationCode> {
  String phoneNumber;
  String password;
  _VerficationCodeState({this.phoneNumber, this.password});

  String access_token;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPref();
  }

  String phone;

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    phone = preferences.getString("phone");
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
                      height: MediaQuery.of(context).size.height * 0.860,
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
                                image: AssetImage('assets/profile.png'),
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
                                    'Code has been sent to +201123456789',
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
                                    TweenAnimationBuilder(
                                      tween: Tween(begin: 30.0, end: 0),
                                      duration: Duration(seconds: 40),
                                      builder: (context, value, child) => Text(
                                        "00:${value.toInt()}",
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Color(0xFF4B0082),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      " Resend",
                                      style: TextStyle(
                                        color: Color(0xFF0FFCE93D8),
                                      ),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 20,
                                  ),
                                  child: OtpFort(),
                                ),
                              ],
                            ),

                            SizedBox(
                              width: MediaQuery.of(context).size.width / 1.7,
                              height: 60,
                              child: ElevatedButton(
                                onPressed: () async {
                                  bool result =
                                      await Provider.of<UserViewModel>(
                                    context,
                                    listen: false,
                                  ).OTP(
                                    "123456",
                                    access_token,
                                  );
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => splashScreen(),
                                    ),
                                  );
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
                              height: 10,
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

class OtpFort extends StatefulWidget {
  @override
  _OtpFortState createState() => _OtpFortState();
}

class _OtpFortState extends State<OtpFort> {
  FocusNode pin2FocusNode;
  FocusNode pin3FocusNode;
  FocusNode pin4FocusNode;
  FocusNode pin5FocusNode;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
    pin5FocusNode = FocusNode();
  }

  @override
  void dispose() {
    // TODO: implement dispose
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

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 50,
            height: 60,
            child: TextFormField(
              autofocus: true,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              style: TextStyle(
                fontSize: 24,
              ),
              decoration: InputDecoration(
                hintText: '_',
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
            ),
          ),
          SizedBox(
            width: 50,
            height: 60,
            child: TextFormField(
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              style: TextStyle(
                fontSize: 24,
              ),
              decoration: InputDecoration(
                hintText: "_",
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
            ),
          ),
          SizedBox(
            width: 50,
            height: 60,
            child: TextFormField(
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              style: TextStyle(
                fontSize: 24,
              ),
              decoration: InputDecoration(
                hintText: "_",
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
            ),
          ),
          SizedBox(
            width: 50,
            height: 60,
            child: TextFormField(
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              style: TextStyle(
                fontSize: 24,
              ),
              decoration: InputDecoration(
                hintText: "_",
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
            ),
          ),
          SizedBox(
            width: 50,
            height: 60,
            child: TextFormField(
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              style: TextStyle(
                fontSize: 24,
              ),
              decoration: InputDecoration(
                hintText: "_",
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
            ),
          ),
        ],
      ),
    );
  }
}
