import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:loginscreen/authentication/newLoginVerf.dart';
import 'package:loginscreen/authentication/newSignIn.dart';
import 'package:loginscreen/authentication/verficationcode.dart';
import 'package:loginscreen/authentication/verficationcodelogin.dart';
import 'package:loginscreen/Home.dart';
import 'package:loginscreen/viewmodel/userviewmodel.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Model/user.dart';
import '../loading.dart';

class newEnterPassword extends StatefulWidget {
  String value;

  newEnterPassword({this.value});

  @override
  _newEnterPasswordState createState() => _newEnterPasswordState(value);
}

class _newEnterPasswordState extends State<newEnterPassword> {
  String value;
  _newEnterPasswordState(this.value);

  final passwordKey = GlobalKey<FormState>();

  bool isLoading = false;

  TextEditingController passwordController = TextEditingController();

  String phone;
  String forgetformat;

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    phone = preferences.getString("phone");
    forgetformat = preferences.getString("forgetformat");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPref();
  }

  @override
  Widget build(BuildContext context) {
    var _blankFocusNode = new FocusNode();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          // title: Image('assets/logo.png'),You can add title here
          title: Image(
            image: AssetImage(
              'assets/logo.png',
            ),
            width: MediaQuery.of(context).size.width * 0.35,
            height: MediaQuery.of(context).size.height * 0.026,
          ),
          leading: new IconButton(
            icon: new Icon(
              Icons.arrow_back_outlined,
              color: Colors.black,
              size: MediaQuery.of(context).size.width * 0.07,
            ),
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => newSignIn(),
              ),
            ),
          ),
          backgroundColor: Color(0xFFF9FAFF), //You can make this transparent
          elevation: 0.0, //No shadow
        ),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(_blankFocusNode);
          },
          child: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                color: Color(0xFFF9FAFF),
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.884,
                      height: MediaQuery.of(context).size.height * 0.755,
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
                      child: Center(
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: EdgeInsets.only(
                                  top: 15,
                                  left: 35,
                                  right: 35,
                                  bottom: 15,
                                ),
                                child: Image(
                                  image: AssetImage('assets/password.png'),
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
                                      'ENTER YOUR PASSWORD',
                                      style: TextStyle(
                                        fontFamily: 'SegoeUI',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 1,
                                  ),
                                  Container(
                                    //   padding: EdgeInsets.only(top: 10),
                                    height: 4.0,
                                    width:
                                        MediaQuery.of(context).size.width / 6,
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
                                        'Password',
                                        style: TextStyle(
                                          color: Colors.grey.shade600,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Form(
                                      key: passwordKey,
                                      child: Container(
                                        child: TextFormField(
                                          textAlignVertical:
                                              TextAlignVertical.bottom,
                                          textInputAction: TextInputAction.done,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                          ),
                                          obscureText: true,
                                          controller: passwordController,
                                          decoration: InputDecoration(
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Colors.black,
                                              ),
                                              borderRadius:
                                                  const BorderRadius.all(
                                                const Radius.circular(10.0),
                                              ),
                                            ),
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    vertical: 15,
                                                    horizontal: 15),
                                            hintText: '*************',
                                            hintStyle: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 17,
                                            ),
                                            errorStyle: TextStyle(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 13,
                                            ),
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
                                          validator: (value) {
                                            if (value.isEmpty)
                                              return "Required";
                                            else if (value.length < 5) {
                                              return "Not Valid";
                                            }
                                          },
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    // isLoading ? Loading() : Container(),
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: GestureDetector(
                                        onTap: !isLoading
                                            ? () async {
                                                setState(() {
                                                  isLoading = true;
                                                });
                                                await Provider.of<
                                                    UserViewModel>(
                                                  context,
                                                  listen: false,
                                                ).forgetPassword(
                                                  User(
                                                    phone: "20-${forgetformat}",
                                                  ),
                                                );
                                                setState(() {
                                                  isLoading = false;
                                                });
                                                Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        PinCodeVerificationScreen(),
                                                  ),
                                                );
                                              }
                                            : null,
                                        child: Text(
                                          'Forget Password?',
                                          style: TextStyle(
                                              color: Color(0xFF4B0082),
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    isLoading ? Loading() : Container(),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              14,
                                      child: ElevatedButton(
                                        onPressed: !isLoading
                                            ? () async {
                                                if (!passwordKey.currentState
                                                    .validate()) {
                                                  print(
                                                      "Error In Writing password");
                                                } else {
                                                  setState(() {
                                                    isLoading = true;
                                                  });
                                                  var result = await Provider
                                                      .of<UserViewModel>(
                                                    context,
                                                    listen: false,
                                                  ).login(
                                                    phoneNumber:
                                                        "20-${forgetformat}",
                                                    password:
                                                        passwordController.text,
                                                  );
                                                  setState(() {
                                                    isLoading = false;
                                                  });
                                                  if (result) {
                                                    Fluttertoast.showToast(
                                                      msg: "Sucess",
                                                      toastLength:
                                                          Toast.LENGTH_LONG,
                                                      gravity:
                                                          ToastGravity.BOTTOM,
                                                      timeInSecForIosWeb: 1,
                                                      backgroundColor:
                                                          Colors.black,
                                                      textColor: Colors.white,
                                                      fontSize: 16.0,
                                                    );
                                                    print("Sucess");
                                                    Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            Home(),
                                                      ),
                                                    );
                                                  } else {
                                                    Fluttertoast.showToast(
                                                      msg: "Invalid Password",
                                                      toastLength:
                                                          Toast.LENGTH_SHORT,
                                                      gravity:
                                                          ToastGravity.BOTTOM,
                                                      timeInSecForIosWeb: 1,
                                                      backgroundColor:
                                                          Colors.black,
                                                      textColor: Colors.white,
                                                      fontSize: 16.0,
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
                                          'Sign In',
                                          style: TextStyle(
                                            fontSize: 20,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.84,
                      height: MediaQuery.of(context).size.height / 14,
                      child: RaisedButton(
                        // color: Color(0xFFE0E0E0),
                        color: Colors.grey.shade300,
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(10.0)),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Continue As Driver',
                          style: TextStyle(
                            fontFamily: 'Segoe-UI-Bold',
                            fontSize: 18.0,
                            // color: Color(0xFF333333),
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom,
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
