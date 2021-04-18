import 'package:flutter/material.dart';
import 'package:loginscreen/verficationcode.dart';
import 'package:loginscreen/verficationcodelogin.dart';
import 'package:loginscreen/Home.dart';
import 'package:loginscreen/viewmodel/userviewmodel.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Model/user.dart';

class EnterPassword extends StatefulWidget {
  String value;

  EnterPassword({this.value});

  @override
  _EnterPasswordState createState() => _EnterPasswordState(value);
}

class _EnterPasswordState extends State<EnterPassword> {
  String value;
  _EnterPasswordState(this.value);

  final passwordKey = GlobalKey<FormState>();

  TextEditingController passwordController = TextEditingController();

  String phone;
  String forgetformat;

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    phone = preferences.getString("phone");
    print("Phone From Enter PAssword");
    print(phone);
    print("----------------");
    forgetformat = preferences.getString("forgetformat");
    print("That what is back from forgetformat");
    print(forgetformat);
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
            height: MediaQuery.of(context).size.height * 0.066,
          ),
          leading: new IconButton(
            icon: new Icon(
              Icons.arrow_back_outlined,
              color: Colors.black,
              size: MediaQuery.of(context).size.width * 0.07,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Color(0xFFF9FAFF), //You can make this transparent
          elevation: 0.0, //No shadow
        ),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(_blankFocusNode);
          },
          child: SafeArea(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              color: Color(0xFFF9FAFF),
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.884,
                    height: MediaQuery.of(context).size.height * 0.700,
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
                              image: AssetImage('assets/password.png'),
                              // fit: BoxFit.contain,
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                // width: MediaQuery.of(context).size.width / 4,
                                // height: MediaQuery.of(context).size.height / 25,
                                height: MediaQuery.of(context).size.height / 25,
                                child: Text(
                                  'ENTER YOUR PASSWORD',
                                  style: TextStyle(
                                    fontFamily: 'SegoeUI',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 21,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Container(
                                //   padding: EdgeInsets.only(top: 10),
                                height: 4.0,
                                width: MediaQuery.of(context).size.width / 7,
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
                                    'Password',
                                    style: TextStyle(
                                      color: Colors.grey.shade600,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Form(
                                  key: passwordKey,
                                  child: Container(
                                    // width:
                                    //     MediaQuery.of(context).size.width / 1.1,
                                    // height:
                                    //     MediaQuery.of(context).size.height / 13,
                                    child: TextFormField(
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
                                          borderRadius: const BorderRadius.all(
                                            const Radius.circular(10.0),
                                          ),
                                        ),
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 20, horizontal: 20),
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
                                          borderRadius: const BorderRadius.all(
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
                                Align(
                                  alignment: Alignment.topRight,
                                  child: InkWell(
                                    onTap: () {
                                      Provider.of<UserViewModel>(
                                        context,
                                        listen: false,
                                      ).forgetPassword(
                                        User(
                                          phone: forgetformat,
                                        ),
                                      );

                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              loginVerficationCode(),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      'Forget Password?',
                                      style: TextStyle(
                                          color: Color(0xFF4B0082),
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  height: 60,
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      // var isSignIn = true;

                                      if (!passwordKey.currentState
                                          .validate()) {
                                        print("Error In Writing password");
                                      } else {
                                        await Provider.of<UserViewModel>(
                                          context,
                                          listen: false,
                                        ).login(
                                          phoneNumber: forgetformat,
                                          password: passwordController.text,
                                        );

                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) => Home(),
                                          ),
                                        );
                                      }

                                      // if (isSignIn) {
                                      //   SnackBar snackBar = SnackBar(
                                      //     content: Text(
                                      //       'Yes True ',
                                      //       style: TextStyle(
                                      //         color: Colors.black,
                                      //         fontWeight: FontWeight.bold,
                                      //       ),
                                      //     ),
                                      //     duration: Duration(seconds: 2),
                                      //     backgroundColor: Colors.grey,
                                      //   );
                                      //
                                      //   ScaffoldMessenger.of(context)
                                      //       .showSnackBar(snackBar);
                                      // } else {
                                      //   SnackBar snackBar = SnackBar(
                                      //     content: Text(
                                      //       'You Have To Accept Terms and Conditions',
                                      //       style: TextStyle(
                                      //         color: Colors.black,
                                      //         fontWeight: FontWeight.bold,
                                      //       ),
                                      //     ),
                                      //     duration: Duration(seconds: 2),
                                      //     backgroundColor: Colors.grey,
                                      //   );
                                      //
                                      //   ScaffoldMessenger.of(context)
                                      //       .showSnackBar(snackBar);
                                      // }
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
                                      'Sign In',
                                      style: TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.84,
                    height: 60,
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
