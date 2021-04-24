import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:loginscreen/enterpassword.dart';
import 'package:loginscreen/loading.dart';
import 'package:loginscreen/newEnterPasswod.dart';
import 'package:loginscreen/signup.dart';
import 'package:loginscreen/splashscreen.dart';
import 'package:loginscreen/viewmodel/userviewmodel.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Model/user.dart';
import 'validate.dart' as valid;
import 'package:country_code_picker/country_code_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as JSON;

class newSignIn extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _newSignInState createState() => _newSignInState();
}

class _newSignInState extends State<newSignIn> {
  final phoneKey = GlobalKey<FormState>();

  TextEditingController PhoneNumberController = TextEditingController();

  bool isLoading = false;
  String value;

  savePref(String phone, String forgetformat) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("phone", phone);
    preferences.setString("forgetformat", forgetformat);
  }

  @override
  Widget build(BuildContext context) {
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
            child: Container(
              alignment: Alignment.center,
              child: Container(
                color: Color(0xFFF9FAFF),
                child: Column(
                  children: [
                    Image(
                      image: AssetImage(
                        'assets/logo.png',
                      ),
                      width: MediaQuery.of(context).size.width * 0.35,
                      height: MediaQuery.of(context).size.height * 0.026,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.874,
                      height: MediaQuery.of(context).size.height * 0.890,
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
                                top: 10,
                                left: 35,
                                right: 35,
                                bottom: 15,
                              ),
                              child: Image(
                                image: AssetImage('assets/login.png'),
                                // fit: BoxFit.contain,
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height / 25,
                                  child: Text(
                                    'SIGN IN',
                                    style: TextStyle(
                                      fontFamily: 'SegoeUI',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 3
                                    // MediaQuery.of(context).size.height /
                                    //     180,
                                    ),
                                Container(
                                  //   padding: EdgeInsets.only(top: 10),
                                  height: 3.0,
                                  width: MediaQuery.of(context).size.width / 10,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: 10.0,
                                left: 10,
                                right: 10,
                              ),
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Mobile Number',
                                      style: TextStyle(
                                        color: Colors.grey.shade600,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Form(
                                          key: phoneKey,
                                          child: Container(
                                            child: TextFormField(
                                              textAlignVertical:
                                                  TextAlignVertical.bottom,
                                              onChanged: (text) {
                                                value = text;
                                              },
                                              controller: PhoneNumberController,
                                              decoration: InputDecoration(
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Colors.black,
                                                  ),
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                    const Radius.circular(10.0),
                                                  ),
                                                ),
                                                prefixIcon: Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      5,
                                                  child: Row(
                                                    children: [
                                                      CountryCodePicker(
                                                        onInit: (value) {},
                                                        initialSelection: 'EG',
                                                        showFlag: false,
                                                        alignLeft: false,
                                                        textStyle: TextStyle(
                                                          fontSize: 15,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                      Container(
                                                        padding:
                                                            EdgeInsets.only(
                                                                right: 10),
                                                        height: 20.0,
                                                        color: Colors.black,
                                                        width: 1,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                errorStyle: TextStyle(
                                                  color: Colors.grey,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15,
                                                ),
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                        vertical: 20,
                                                        horizontal: 10),
                                                hintText: '11234567890',
                                                border: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Colors.teal,
                                                  ),
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                    const Radius.circular(10.0),
                                                  ),
                                                ),
                                              ),
                                              keyboardType:
                                                  TextInputType.number,
                                              validator: (value) {
                                                if (value.isEmpty) {
                                                  return "Requird";
                                                } else if (value.length < 10 ||
                                                    value.length > 11) {
                                                  return "Not Valid Number";
                                                }
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  isLoading ? Loading() : Container(),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    height:
                                        MediaQuery.of(context).size.height / 14,
                                    child: ElevatedButton(
                                      onPressed: !isLoading
                                          ? () async {
                                              if (!phoneKey.currentState
                                                  .validate()) {
                                                print("Error Format");
                                              } else {
                                                setState(() {
                                                  isLoading = true;
                                                });
                                                var result = await Provider.of<
                                                    UserViewModel>(
                                                  context,
                                                  listen: false,
                                                ).check(
                                                  "${PhoneNumberController.text}",
                                                );
                                                setState(() {
                                                  isLoading = false;
                                                });
                                                if (result) {
                                                  savePref(
                                                      "20-${PhoneNumberController.text}",
                                                      "${PhoneNumberController.text}");
                                                  Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          newEnterPassword(
                                                        value:
                                                            ("20-${PhoneNumberController.text}"),
                                                      ),
                                                    ),
                                                  );
                                                } else {
                                                  savePref(
                                                      "20-${PhoneNumberController.text}",
                                                      "${PhoneNumberController.text}");
                                                  Fluttertoast.showToast(
                                                    msg: "User not found",
                                                    toastLength:
                                                        Toast.LENGTH_SHORT,
                                                    gravity:
                                                        ToastGravity.BOTTOM,
                                                    timeInSecForIosWeb: 1,
                                                    backgroundColor:
                                                        Colors.grey,
                                                    textColor: Colors.white,
                                                    fontSize: 16.0,
                                                  );
                                                  Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          SignUp(),
                                                    ),
                                                  );
                                                }
                                              }
                                            }
                                          : null,
                                      style: ButtonStyle(
                                        shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                        ),
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                          Color(0xFF4B0082),
                                        ),
                                      ),
                                      child: Text(
                                        'Next',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 0.0,
                                                right: 0.0,
                                                top: 5.0,
                                                bottom: 0.0),
                                            child: ButtonTheme(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  14,
                                              child: new RaisedButton(
                                                elevation: 0.0,
                                                shape:
                                                    new RoundedRectangleBorder(
                                                        side: BorderSide(
                                                          color: Color(
                                                              0xFF6B778D4D),
                                                          width: 2,
                                                        ),
                                                        borderRadius:
                                                            new BorderRadius
                                                                    .circular(
                                                                10.0)),
                                                padding: EdgeInsets.only(
                                                  top: 7.0,
                                                  bottom: 7.0,
                                                  right: 20,
                                                  left: 7.0,
                                                ),
                                                onPressed: () {},
                                                child: new Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: <Widget>[
                                                    new Image.asset(
                                                        'assets/face.png',
                                                        height: 20.0,
                                                        width: 20.0),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 10.0),
                                                      child: new Text(
                                                        "facebook",
                                                        style: TextStyle(
                                                          fontSize: 15.0,
                                                          color: Colors
                                                              .grey.shade600,
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                textColor: Color(0xFF292929),
                                                color: Color(0xFFFFFFFF),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                              left: 0.0,
                                              right: 0.0,
                                              top: 5.0,
                                              bottom: 0.0,
                                            ),
                                            child: ButtonTheme(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  14,
                                              child: new RaisedButton(
                                                elevation: 0.0,
                                                shape:
                                                    new RoundedRectangleBorder(
                                                  side: BorderSide(
                                                    color: Color(0xFF6B778D4D),
                                                    width: 2,
                                                  ),
                                                  borderRadius:
                                                      new BorderRadius.circular(
                                                    10.0,
                                                  ),
                                                ),
                                                padding: EdgeInsets.only(
                                                  top: 7.0,
                                                  bottom: 7.0,
                                                  right: 20,
                                                  left: 7.0,
                                                ),
                                                onPressed: () {},
                                                child: new Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: <Widget>[
                                                    new Image.asset(
                                                        'assets/google.png',
                                                        height: 20.0,
                                                        width: 20.0),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 10.0),
                                                      child: new Text(
                                                        "Google",
                                                        style: TextStyle(
                                                          fontSize: 15.0,
                                                          color: Colors
                                                              .grey.shade600,
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                textColor: Color(0xFF292929),
                                                color: Color(0xFFFFFFFF),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Divider(
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.82,
                              height: MediaQuery.of(context).size.height / 14,
                              child: RaisedButton(
                                color: Color(0xFFE0E0E0),
                                shape: new RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(10.0)),
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => splashScreen(),
                                    ),
                                  );
                                },
                                child: Text(
                                  'Continue As Driver',
                                  style: TextStyle(
                                    fontFamily: 'Segoe-UI-Bold',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15.0,
                                    // color: Color(0xFF333333),
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).viewInsets.bottom,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
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
