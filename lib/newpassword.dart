import 'package:flutter/material.dart';
import 'package:loginscreen/enterpassword.dart';
import 'package:loginscreen/viewmodel/userviewmodel.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NewPassword extends StatefulWidget {
  @override
  _NewPasswordState createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  final passwordKey = GlobalKey<FormState>();

  TextEditingController PasswordController = TextEditingController();
  TextEditingController ConfirmPasswordController = TextEditingController();

  String phone;

  String forgetformat;

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    forgetformat = preferences.getString("forgetformat");

    print(
        "Phone From New Password and password confirmation  is ${forgetformat} ");
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
                    height: MediaQuery.of(context).size.height * 0.770,
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
                              image: AssetImage('assets/repas.png'),
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
                                      fontSize: 20,
                                    ),
                                  )),
                              SizedBox(
                                height: 2,
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
                            child: Form(
                              key: passwordKey,
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'New Password',
                                      style: TextStyle(
                                        color: Colors.grey.shade600,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  TextFormField(
                                    textInputAction: TextInputAction.next,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                    ),
                                    obscureText: true,
                                    controller: PasswordController,
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
                                      else if (value.length < 4) {
                                        return "week password";
                                      }
                                    },
                                  ),
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Confirm New Password',
                                      style: TextStyle(
                                        color: Colors.grey.shade600,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  TextFormField(
                                    textInputAction: TextInputAction.next,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                    ),
                                    obscureText: true,
                                    controller: ConfirmPasswordController,
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
                                      else if (value !=
                                          PasswordController.text) {
                                        return "Not Matched";
                                      }
                                    },
                                  ),
                                  SizedBox(
                                    height: 15.0,
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    height: 60,
                                    child: ElevatedButton(
                                      onPressed: () async {
                                        if (passwordKey.currentState
                                            .validate()) {
                                          print('Error in Forms');
                                          await Provider.of<UserViewModel>(
                                                  context,
                                                  listen: false)
                                              .newPassword(
                                                  forgetformat,
                                                  "123456",
                                                  PasswordController.text);

                                          SnackBar snackBar = SnackBar(
                                            content: Text(
                                              'Error Format',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            duration: Duration(seconds: 2),
                                            backgroundColor: Colors.grey,
                                          );
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(snackBar);
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    EnterPassword()),
                                          );
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
                                        'Change Password',
                                        style: TextStyle(
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                  // SizedBox(
                                  //   height: 5,
                                  // ),
                                ],
                              ),
                            ),
                          ),
                          // SizedBox(
                          //   height: 8,
                          // ),
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
    );
  }
}
