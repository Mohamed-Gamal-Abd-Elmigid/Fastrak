import 'package:flutter/material.dart';
import 'package:loginscreen/enterpassword.dart';
import 'package:loginscreen/onBording.dart';
import 'package:loginscreen/signin.dart';
import 'package:loginscreen/signup.dart';
import 'package:loginscreen/splashscreen.dart';
import 'package:loginscreen/viewmodel/userviewmodel.dart';
import 'package:provider/provider.dart';
import 'validate.dart' as valid;
import 'package:country_code_picker/country_code_picker.dart';
// import 'package:font_awesome_flutter/fonts/';

void main() {
  runApp(
    MaterialApp(
      home: MyApp(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: UserViewModel(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SignUp(),
        // routes: {
        //   '/': (context) => splashScreen(),
        //   'signIn': (context) => signIn(),
        // },
      ),
    );
  }
}
