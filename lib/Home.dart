import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:loginscreen/loading.dart';
import 'package:loginscreen/authentication/newSignIn.dart';
import 'package:loginscreen/authentication/signin.dart';
import 'package:loginscreen/authentication/signup.dart';
import 'package:loginscreen/pickupLocation.dart';
import 'package:loginscreen/viewmodel/userviewmodel.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'notification.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String token;
  String phone;
  String email;

  bool loading = false;

  // TextEditingController emailController = TextEditingController();
  // TextEditingController phoneController = TextEditingController();

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    setState(() {
      token = preferences.getString("token");
      phone = preferences.getString("phone");
      email = preferences.getString("email");
      loading = false;
    });

    print("Token From Home Page");
    print(token);

    print("Email From Home Page");
    print(email);
    print("Phone From Home Page");
    print(phone);

    print("----------------");

    loading = false;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() => loading = true);
    getPref();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          // title:   Image('assets/logo.png'),You can add title here
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
        body: SafeArea(
          child: Center(
            child: loading
                ? Loading()
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Phone is :  ${phone}',
                        style: TextStyle(
                          fontSize: 24,
                        ),
                      ),
                      Text(
                        'Email is : ${email}',
                        style: TextStyle(
                          fontSize: 24,
                        ),
                      ),
                      RaisedButton(
                        color: Colors.grey,
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => NotificationFastrak(),
                            ),
                          );
                        },
                        child: Text(
                          "Notificion",
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      RaisedButton(
                        color: Colors.grey,
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => NotificationFastrak(),
                            ),
                          );
                        },
                        child: Text(
                          "Location",
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 100,
                      ),
                      RaisedButton(
                        color: Colors.grey,
                        onPressed: () {
                          Provider.of<UserViewModel>(
                            context,
                            listen: false,
                          ).logOut(token);
                          Fluttertoast.showToast(
                            msg: "Logout Completed",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.grey,
                            textColor: Colors.white,
                            fontSize: 16.0,
                          );
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => newSignIn(),
                            ),
                          );
                        },
                        child: Text(
                          "Log Out",
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
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
