import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:loginscreen/newNewPassword.dart';
import 'package:loginscreen/viewmodel/userviewmodel.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PinCodeVerificationScreen extends StatefulWidget {
  final String phoneNumber = "8801376221100";

  @override
  _PinCodeVerificationScreenState createState() =>
      _PinCodeVerificationScreenState();
}

class _PinCodeVerificationScreenState extends State<PinCodeVerificationScreen> {
  var onTapRecognizer;

  TextEditingController textEditingController = TextEditingController();
  // ..text = "123456";

  StreamController<ErrorAnimationType> errorController;

  String forgetformat;
  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    forgetformat = preferences.getString("forgetformat");
  }

  bool hasError = false;
  String currentText = " ";
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  Timer _timer;
  int _start = 20;
  bool canResend = false;
  bool isLoading = false;

  void startTimer() {
    _start = 20;
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
            canResend = true;
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void initState() {
    getPref();
    startTimer();
    onTapRecognizer = TapGestureRecognizer()
      ..onTap = () {
        Navigator.pop(context);
      };
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController.close();
    _timer.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var _blankFocusNode = new FocusNode();

    return Scaffold(
      resizeToAvoidBottomInset: false,

      // backgroundColor: Colors.blue.shade50,
      key: scaffoldKey,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(_blankFocusNode);
        },
        child: SafeArea(
          child: Center(
            child: Container(
              color: Color(0xFFF9FAFF),
              // color: Colors.black,
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
                    height: MediaQuery.of(context).size.height * 0.820,
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
                    child: ListView(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(
                            top: 25,
                            left: 45,
                            right: 45,
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
                              height: MediaQuery.of(context).size.height / 20,
                              child: Text(
                                'VERFICATION CODE',
                                style: TextStyle(
                                  fontFamily: 'SegoeUI',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            Container(
                              height: 4.0,
                              width: MediaQuery.of(context).size.width / 8,
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
                                'Code has been sent to ${forgetformat}',
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
                                    color: Colors.purple,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                InkWell(
                                  onTap: canResend
                                      ? () {
                                          startTimer();
                                        }
                                      : null,
                                  child: Text(
                                    " Resend",
                                    style: TextStyle(
                                      color: Color(0xFF4B0082),
                                      fontSize: 16,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Form(
                          key: formKey,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 4.0, horizontal: 10),
                            child: PinCodeTextField(
                              appContext: context,
                              pastedTextStyle: TextStyle(
                                color: Colors.green.shade600,
                                fontWeight: FontWeight.bold,
                              ),
                              length: 6,
                              animationType: AnimationType.fade,
                              // validator: (v) {
                              //   if (v.length < 5) {
                              //     return "Not Vaild";
                              //   } else {
                              //     return null;
                              //   }
                              // },
                              pinTheme: PinTheme(
                                selectedColor: Colors.black,
                                activeColor: Colors.black,
                                inactiveColor: Colors.grey,
                                selectedFillColor: Colors.grey.shade400,
                                inactiveFillColor: Colors.white,
                                shape: PinCodeFieldShape.box,
                                borderRadius: BorderRadius.circular(5),
                                fieldHeight:
                                    MediaQuery.of(context).size.height / 14,
                                fieldWidth: 50,
                                activeFillColor:
                                    hasError ? Colors.grey : Colors.white,
                              ),
                              cursorColor: Colors.black,
                              animationDuration: Duration(milliseconds: 300),
                              textStyle: TextStyle(fontSize: 20, height: 1.6),
                              enableActiveFill: true,
                              errorAnimationController: errorController,
                              controller: textEditingController,
                              keyboardType: TextInputType.number,
                              boxShadows: [
                                BoxShadow(
                                  offset: Offset(0, 1),
                                  color: Colors.black12,
                                  blurRadius: 10,
                                )
                              ],
                              onCompleted: (v) {
                                print("Completed");
                              },
                              onChanged: (value) {
                                print(value);
                                setState(() {
                                  currentText = value;
                                });
                              },
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 6.0, horizontal: 10),
                          child: ButtonTheme(
                            height: MediaQuery.of(context).size.height / 14,
                            child: FlatButton(
                              onPressed: !isLoading
                                  ? () async {
                                      if (formKey.currentState.validate()) {
                                        if (currentText.length != 6 &&
                                            currentText != "123456") {
                                          errorController.add(ErrorAnimationType
                                              .shake); // Triggering error shake animation
                                          setState(() {
                                            hasError = true;
                                          });
                                          Fluttertoast.showToast(
                                            msg: " not Valid",
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.BOTTOM,
                                            timeInSecForIosWeb: 1,
                                            backgroundColor: Colors.black,
                                            textColor: Colors.white,
                                            fontSize: 16.0,
                                          );
                                        } else {
                                          setState(() {
                                            hasError = false;
                                          });
                                          Fluttertoast.showToast(
                                            msg: "Valid",
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.BOTTOM,
                                            timeInSecForIosWeb: 1,
                                            backgroundColor: Colors.black,
                                            textColor: Colors.white,
                                            fontSize: 16.0,
                                          );
                                          print(currentText);
                                          setState(() {
                                            isLoading = true;
                                          });
                                          bool result =
                                              await Provider.of<UserViewModel>(
                                            context,
                                            listen: false,
                                          ).confirmUserCode(
                                                  forgetformat, currentText);
                                          setState(() {
                                            isLoading = false;
                                          });
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  newNewPassword(),
                                            ),
                                          );
                                        }
                                      }
                                    }
                                  : null,
                              child: Center(
                                  child: Text(
                                "Confirm",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              )),
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xFF4B0082),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom,
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
      ),
    );
  }
}
