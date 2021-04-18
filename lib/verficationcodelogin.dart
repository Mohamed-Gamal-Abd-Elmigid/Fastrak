import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loginscreen/newpassword.dart';
import 'package:loginscreen/viewmodel/userviewmodel.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class loginVerficationCode extends StatefulWidget {
  @override
  _loginVerficationCodeState createState() => _loginVerficationCodeState();
}

class _loginVerficationCodeState extends State<loginVerficationCode> {
  TextEditingController firstNumber = TextEditingController();
  TextEditingController secondNumber = TextEditingController();
  TextEditingController thirdNumber = TextEditingController();
  TextEditingController fourNumber = TextEditingController();
  TextEditingController fiveNumber = TextEditingController();

  FocusNode pin2FocusNode;
  FocusNode pin3FocusNode;
  FocusNode pin4FocusNode;
  FocusNode pin5FocusNode;

  String forgetformat;
  String phone;

  final otpKey = GlobalKey<FormState>();

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    forgetformat = preferences.getString("forgetformat");
    phone = preferences.getString("phone");
    print("Phone From Verfication is ${phone} ");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPref();
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
              controller: firstNumber,
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
              validator: (value) {
                if (value.isEmpty) return "Required";
              },
            ),
          ),
          SizedBox(
            width: 50,
            height: 60,
            child: TextFormField(
              controller: secondNumber,
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
              validator: (value) {
                if (value.isEmpty) return "Required";
              },
            ),
          ),
          SizedBox(
            width: 50,
            height: 60,
            child: TextFormField(
              controller: thirdNumber,
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
              validator: (value) {
                if (value.isEmpty) return "Required";
              },
            ),
          ),
          SizedBox(
            width: 50,
            height: 60,
            child: TextFormField(
              controller: fourNumber,
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
              validator: (value) {
                if (value.isEmpty) return "Required";
              },
            ),
          ),
          SizedBox(
            width: 50,
            height: 60,
            child: TextFormField(
              controller: fiveNumber,
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
              validator: (value) {
                if (value.isEmpty) return "Required";
              },
            ),
          ),
        ],
      ),
    );
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
                                    TweenAnimationBuilder(
                                      tween: Tween(begin: 40.0, end: 0),
                                      duration: Duration(seconds: 40),
                                      builder: (context, value, child) => Text(
                                        "00:${value.toInt()}",
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Color(0xFF4B0082),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        TweenAnimationBuilder(
                                          tween: Tween(begin: 40.0, end: 0),
                                          duration: Duration(seconds: 40),
                                          builder: (context, value, child) =>
                                              Text(
                                            "00:${value.toInt()}",
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: Color(0xFF4B0082),
                                            ),
                                          ),
                                        );
                                      },
                                      child: Text(
                                        " Resend",
                                        style: TextStyle(
                                          color: Color(0xFF0FFCE93D8),
                                        ),
                                      ),
                                    )
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
                                  var sendOTP =
                                      "${firstNumber.text}${secondNumber.text}${thirdNumber.text}${fourNumber.text}${fiveNumber.text}";
                                  if (!otpKey.currentState.validate()) {
                                    print("Error in Validation");
                                  } else {
                                    bool result =
                                        await Provider.of<UserViewModel>(
                                      context,
                                      listen: false,
                                    ).confirmUserCode(forgetformat, "123456");
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => NewPassword(),
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
                              height: 10,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  bottom:
                                      MediaQuery.of(context).viewInsets.bottom),
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
