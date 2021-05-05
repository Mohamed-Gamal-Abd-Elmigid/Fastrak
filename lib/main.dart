import 'package:flutter/material.dart';
import 'package:loginscreen/Home.dart';
import 'package:loginscreen/Model/notification.dart';

import 'package:loginscreen/authentication/newSignIn.dart';
import 'package:loginscreen/configMaps.dart';
import 'package:loginscreen/notification.dart';
import 'package:loginscreen/searchScreen.dart';

import 'package:loginscreen/viewmodel/userviewmodel.dart';
import 'package:provider/provider.dart';
import 'validate.dart' as valid;

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
        home: Home(),
      ),
    );
  }
}
