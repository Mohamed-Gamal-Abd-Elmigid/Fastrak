import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:loginscreen/enterpassword.dart';
import 'package:loginscreen/loading.dart';
import 'package:loginscreen/signup.dart';
import 'package:loginscreen/splashscreen.dart';
import 'package:loginscreen/viewmodel/userviewmodel.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splashscreen/splashscreen.dart';
import 'Model/user.dart';
import 'validate.dart' as valid;
import 'package:country_code_picker/country_code_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as JSON;
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignIn extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final phoneKey = GlobalKey<FormState>();

  TextEditingController PhoneNumberController = TextEditingController();

  String value;

  bool isflag = true;

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
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(_blankFocusNode);
          },
          child: SafeArea(
            child: Center(
              child: SingleChildScrollView(
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
                        height: MediaQuery.of(context).size.height * 0.840,
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
                                  top: 35,
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
                                    // width: MediaQuery.of(context).size.width / 4,
                                    // height: MediaQuery.of(context).size.height / 25,
                                    height:
                                        MediaQuery.of(context).size.height / 25,
                                    child: Text(
                                      'SIGN IN',
                                      style: TextStyle(
                                        fontFamily: 'SegoeUI',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    //   padding: EdgeInsets.only(top: 10),
                                    height: 4.0,
                                    width:
                                        MediaQuery.of(context).size.width / 7,
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
                                  top: 20.0,
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
                                          fontSize: 18,
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
                                            child: TextFormField(
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
                                                        vertical: 20),
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
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width,
                                      height: 60,
                                      child: ElevatedButton(
                                        onPressed: () async {
                                          if (!phoneKey.currentState
                                              .validate()) {
                                            print("Error Format");
                                          } else {
                                            var result = await Provider.of<
                                                UserViewModel>(
                                              context,
                                              listen: false,
                                            ).check(
                                              "${PhoneNumberController.text}",
                                            );
                                            if (result) {
                                              savePref(
                                                  "20-${PhoneNumberController.text}",
                                                  "${PhoneNumberController.text}");
                                              Navigator.of(context).push(
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      EnterPassword(
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
                                                toastLength: Toast.LENGTH_SHORT,
                                                gravity: ToastGravity.BOTTOM,
                                                timeInSecForIosWeb: 1,
                                                backgroundColor: Colors.grey,
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
                                        },
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
                                            fontSize: 20,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Container(
// color: Colors.green,
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
// height: MediaQuery.of(context).size.height *
//     0.058,
                                                height: 60,
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
                                                  onPressed: () {
                                                    _login();
                                                  },
                                                  child: new Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: <Widget>[
                                                      new Image.asset(
                                                          'assets/face.png',
                                                          height: 30.0,
                                                          width: 30.0),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 10.0),
                                                        child: new Text(
                                                          "facebook",
                                                          style: TextStyle(
                                                            fontSize: 20.0,
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
                                                height: 60,
// height: MediaQuery.of(context).size.height *
//     0.058,
                                                child: new RaisedButton(
                                                  elevation: 0.0,
                                                  shape:
                                                      new RoundedRectangleBorder(
                                                    side: BorderSide(
                                                      color:
                                                          Color(0xFF6B778D4D),
                                                      width: 2,
                                                    ),
                                                    borderRadius:
                                                        new BorderRadius
                                                            .circular(
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
                                                          height: 30.0,
                                                          width: 30.0),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 10.0),
                                                        child: new Text(
                                                          "Google",
                                                          style: TextStyle(
                                                            fontSize: 20.0,
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
                                height: 8,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.84,
                                height: 60,
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
                                    'Back To Start',
                                    style: TextStyle(
                                      fontFamily: 'Segoe-UI-Bold',
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18.0,
                                      // color: Color(0xFF333333),
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    bottom: MediaQuery.of(context)
                                        .viewInsets
                                        .bottom),
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
      ),
    );
  }

  Future<Null> _login() async {
    final FacebookLoginResult result = await facebookSignIn.logIn(['email']);

    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        final FacebookAccessToken accessToken = result.accessToken;
        _showMessage('''
         Logged in!
         
         Token: ${accessToken.token}
         User id: ${accessToken.userId}
         Expires: ${accessToken.expires}
         Permissions: ${accessToken.permissions}
         Declined permissions: ${accessToken.declinedPermissions}
         ''');
        print("${accessToken.token}");
        face("${accessToken.token}");
        print("${accessToken.userId}");
        break;
      case FacebookLoginStatus.cancelledByUser:
        _showMessage('Login cancelled by the user.');
        break;
      case FacebookLoginStatus.error:
        _showMessage('Something went wrong with the login process.\n'
            'Here\'s the error Facebook gave us: ${result.errorMessage}');
        break;
    }
    print("Theis it the result status");
    print(result.status);
  }

  Future<bool> face(String userID) async {
    Map<String, String> header = {
      "Accept": "application/json",
      "Accept-Language": "en",
    };

    Map<String, dynamic> body = {
      "social_type": "facebook",
      "social_id": userID,
      "device_name": "hello egypt",
      "device_id": "123",
      "language": "en",
    };

    var url = '$baseUrl/api/v1/user/auth/social-media/login';
    Uri uri = Uri.parse(url);
    http.Response response = await http.post(
      uri,
      headers: header,
      body: body,
    );
    print(response.body);

    if (response.statusCode == 200) {
      print("Successfly Login with status code 200");
    } else {
      print("Error In Login in Facebook ");
    }

    return true;
  }

  Future<Null> _logOut() async {
    await facebookSignIn.logOut();
    _showMessage('Logged out.');
  }

  void _showMessage(String message) {
    setState(
      () {
        _message = message;
      },
    );
  }

  static final FacebookLogin facebookSignIn = new FacebookLogin();

  String _message = 'Log in/out by pressing the buttons below.';
}
