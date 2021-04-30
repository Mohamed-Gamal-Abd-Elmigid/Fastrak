import 'dart:io';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loginscreen/Model/error.dart';
import 'package:loginscreen/Model/user.dart';
import 'package:loginscreen/authentication/signin.dart';
import 'package:loginscreen/authentication/splashscreen.dart';
import 'package:loginscreen/authentication/verficationcode.dart';
import 'package:loginscreen/viewmodel/userviewmodel.dart';
import 'package:provider/provider.dart';
import '../Home.dart';
import '../validate.dart' as valid;
import 'package:shared_preferences/shared_preferences.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController FirstNameController = TextEditingController();
  TextEditingController LastNameController = TextEditingController();
  TextEditingController EmaiAdressController = TextEditingController();
  TextEditingController PhoneNumberController = TextEditingController();
  TextEditingController CompanyNameController = TextEditingController();
  TextEditingController PasswordController = TextEditingController();
  TextEditingController ConfirmPasswordController = TextEditingController();

  final signup = GlobalKey<FormState>();

  bool _checkbox = false;

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      PhoneNumberController.text = preferences.getString("forgetformat");
    });
  }

  PickedFile _imageFile;
  final ImagePicker _picker = ImagePicker();

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
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => splashScreen(),
                  ),
                );
              }),
          actions: [
            FlatButton(
              color: Colors.grey,
              textColor: Colors.black,
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => SignIn(),
                  ),
                );
              },
              child: Text("Sign In"),
              shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
            ),
          ],
          backgroundColor: Color(0xFFF9FAFF), //You can make this transparent
          elevation: 0.0, //No shadow
        ),
        backgroundColor: Color.fromRGBO(249, 250, 255, 20),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(_blankFocusNode);
          },
          child: Builder(
            builder: (context) {
              return Container(
                color: Color(0xFFF9FAFF),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.884,
                        height: MediaQuery.of(context).size.height * 0.863,
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
                          color: Colors.white,
                        ),
                        child: SingleChildScrollView(
                          child: Center(
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(
                                    left: 20,
                                    top: 20,
                                    right: 20,
                                  ),
                                  child: Form(
                                    key: signup,
                                    child: Column(
                                      children: [
                                        // imagePicker(),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  25,
                                              child: Text(
                                                'SIGN UP',
                                                style: TextStyle(
                                                  fontFamily: 'SegoeUI',
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 24,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  100,
                                            ),
                                            Container(
                                              // padding: EdgeInsets.only(top: 10),
                                              height: 4.0,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  7,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(20),
                                                ),
                                                color: Colors.black,
                                              ),
                                            ),
                                          ],
                                        ),

                                        SizedBox(
                                          height: 20,
                                        ),
                                        Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.336,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.197,
                                                decoration: BoxDecoration(
                                                  // shape: BoxShape.circle,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0),
                                                  color: Color.fromRGBO(
                                                      75, 0, 130, 220),
                                                )),
                                            InkWell(
                                              onTap: () {
                                                print("Pick Photo");
                                                // imagePicker();
                                                imageProfile(context);
                                              },
                                              child: Container(
                                                alignment: Alignment.center,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.287,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.170,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.rectangle,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15.0),
                                                  color: Color.fromRGBO(
                                                      75, 0, 130, 230),
                                                ),
                                                padding: EdgeInsets.all(5),
                                                child: Center(
                                                  child: (_imageFile == null)
                                                      ? Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Image(
                                                              image: AssetImage(
                                                                  'assets/camera.png'),
                                                              width: 30,
                                                              height: 30,
                                                            ),
                                                            SizedBox(
                                                              height: 10,
                                                            ),
                                                            Text(
                                                              'Profile Photo',
                                                              style: TextStyle(
                                                                //rgba(75, 0, 130, 1)
                                                                color: Color
                                                                    .fromRGBO(
                                                                        75,
                                                                        0,
                                                                        130,
                                                                        1),
                                                                fontSize: 12,
                                                              ),
                                                            ),
                                                          ],
                                                        )
                                                      : ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(15),
                                                          child: Image(
                                                            fit: BoxFit.cover,
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.287,
                                                            height: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                0.160,
                                                            image: FileImage(
                                                              File(
                                                                _imageFile.path,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 25.0,
                                        ),
                                        // buildTextField(
                                        //     'First Name', 'Fist Name', FirstNameController),
                                        // buildTextField(
                                        //     'Last Name', 'Last Name', LastNameController),
                                        // buildTextField('Email Address', 'user_name@gmail.com',
                                        //
                                        //     EmaiAdressController),
                                        // buildTextField('Company Name (Optional)',
                                        //     'Company Name', CompanyNameController),
                                        // buildTextField(
                                        //     'Password', '************', PasswordController),
                                        // buildTextField('Confirm Password', '************',
                                        //     ConfirmPasswordController),

                                        //First Name
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            'First Name',
                                            style: TextStyle(
                                              color: Colors.grey.shade500,
                                              fontSize: 15,
                                              fontFamily: 'Segoe-UI',
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 3,
                                        ),
                                        TextFormField(
                                          textInputAction: TextInputAction.next,
                                          style: TextStyle(
                                            fontSize: 20,
                                          ),
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
                                              vertical: 20,
                                              horizontal: 20,
                                            ),
                                            hintText: 'First Name',
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
                                                width: 4,
                                              ),
                                              borderRadius:
                                                  const BorderRadius.all(
                                                const Radius.circular(10.0),
                                              ),
                                            ),
                                          ),
                                          controller: FirstNameController,
                                          validator: (value) {
                                            if (value.isEmpty) return "Requird";
                                            if (value.length < 2)
                                              return "Not Vaild Name";
                                          },
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        //Last Name
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            'Last Name',
                                            style: TextStyle(
                                              color: Colors.grey.shade500,
                                              fontSize: 15,
                                              fontFamily: 'Segoe-UI',
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 3,
                                        ),
                                        TextFormField(
                                          textInputAction: TextInputAction.next,
                                          style: TextStyle(
                                            fontSize: 20,
                                          ),
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
                                                    vertical: 20,
                                                    horizontal: 20),
                                            hintText: 'Last Name',
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
                                          controller: LastNameController,
                                          validator: (value) {
                                            if (value.isEmpty)
                                              return "Required";
                                            if (value.length < 2)
                                              return "Not Vaild Name";
                                          },
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        //Email Address
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            'Email Address',
                                            style: TextStyle(
                                              color: Colors.grey.shade500,
                                              fontSize: 15,
                                              fontFamily: 'Segoe-UI',
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 3,
                                        ),
                                        TextFormField(
                                          textInputAction: TextInputAction.next,
                                          style: TextStyle(
                                            fontSize: 20,
                                          ),
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
                                                    vertical: 20,
                                                    horizontal: 20),
                                            hintText: 'user_name@gmail.com',
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
                                          controller: EmaiAdressController,
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return "Requied";
                                            }
                                            if (!valid.validEmail(value)) {
                                              return "Invalied Email Format";
                                            }
                                          },
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        //Phone Number

                                        //TextField by Yassin
                                        // Container(
                                        //   width: MediaQuery.of(context).size.width,
                                        //   height: MediaQuery.of(context).size.height / 6,
                                        //   child: AppPartsTextFieldNew(),
                                        // ),

                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            'Mobile Number',
                                            style: TextStyle(
                                              color: Colors.grey.shade500,
                                              fontSize: 15,
                                              fontFamily: 'Segoe-UI',
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 3,
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: TextFormField(
                                                textInputAction:
                                                    TextInputAction.next,
                                                style: TextStyle(
                                                  fontSize: 15,
                                                ),
                                                controller:
                                                    PhoneNumberController,
                                                decoration: InputDecoration(
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Colors.black,
                                                    ),
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                      const Radius.circular(
                                                          10.0),
                                                    ),
                                                  ),
                                                  prefixIcon: Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            5.2,
                                                    child: Row(
                                                      children: [
                                                        CountryCodePicker(
                                                          textStyle: TextStyle(
                                                            fontSize: 15,
                                                            color:
                                                                Colors.black54,
                                                          ),
                                                          initialSelection:
                                                              'EG',
                                                          showFlag: false,
                                                          alignLeft: false,
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
                                                    fontSize: 13,
                                                  ),
                                                  contentPadding:
                                                      EdgeInsets.symmetric(
                                                          vertical: 20,
                                                          horizontal: 20),
                                                  hintText: '11234567890',
                                                  hintStyle: TextStyle(
                                                    fontSize: 17,
                                                    color: Colors.grey,
                                                  ),
                                                  border: OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Colors.teal,
                                                    ),
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                      const Radius.circular(
                                                          10.0),
                                                    ),
                                                  ),
                                                ),
                                                keyboardType:
                                                    TextInputType.number,
                                                validator: (value) {
                                                  if (value.isEmpty) {
                                                    return "Requird";
                                                  } else if (value.length !=
                                                      10) {
                                                    return "Not Valid Number";
                                                  }
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),

                                        //Company Name
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            'Company Name(Optional)',
                                            style: TextStyle(
                                              color: Colors.grey.shade500,
                                              fontSize: 15,
                                              fontFamily: 'Segoe-UI',
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 3,
                                        ),
                                        TextFormField(
                                          textInputAction: TextInputAction.next,
                                          style: TextStyle(
                                            fontSize: 20,
                                          ),
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
                                                    vertical: 20,
                                                    horizontal: 20),
                                            hintText: 'Company Name',
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
                                          controller: CompanyNameController,
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        //Password
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            'Password',
                                            style: TextStyle(
                                              color: Colors.grey.shade500,
                                              fontSize: 15,
                                              fontFamily: 'Segoe-UI',
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 3,
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
                                              borderRadius:
                                                  const BorderRadius.all(
                                                const Radius.circular(10.0),
                                              ),
                                            ),
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    vertical: 20,
                                                    horizontal: 20),
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
                                            else if (value.length < 4) {
                                              return "week password";
                                            }
                                          },
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        //Confirm Password
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            'Confirm Password',
                                            style: TextStyle(
                                              color: Colors.grey.shade500,
                                              fontSize: 15,
                                              fontFamily: 'Segoe-UI',
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 3,
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
                                              borderRadius:
                                                  const BorderRadius.all(
                                                const Radius.circular(10.0),
                                              ),
                                            ),
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    vertical: 20,
                                                    horizontal: 20),
                                            hintText: '*************',
                                            hintStyle: TextStyle(
                                              color: Colors.grey,
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
                                            else if (value !=
                                                PasswordController.text)
                                              return "Not Matched";
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Row(
                                    children: [
                                      Container(
                                        child: Checkbox(
                                          value: _checkbox,
                                          activeColor:
                                              Color.fromARGB(255, 43, 54, 62),
                                          onChanged: (v1) {
                                            setState(() {
                                              _checkbox = v1;
                                            });
                                          },
                                        ),
                                      ),
                                      Text.rich(
                                        TextSpan(
                                          text: 'i agree to the ',
                                          children: <InlineSpan>[
                                            TextSpan(
                                              text: 'Terms & Conditions',
                                              style: TextStyle(
                                                color: Colors.purple,
                                                fontWeight: FontWeight.bold,
                                                decoration:
                                                    TextDecoration.underline,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(
                                    top: 0,
                                    left: 20,
                                    right: 20,
                                    bottom: 20,
                                  ),
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.height * 0.1,
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                      ),
                                      backgroundColor: _checkbox
                                          ? MaterialStateProperty.all<Color>(
                                              Color(0xFF4B0082),
                                            )
                                          : MaterialStateProperty.all<Color>(
                                              Colors.deepPurple.shade200,
                                            ),
                                    ),
                                    onPressed: () async {
                                      // // // ToDo sginup method
                                      //

                                      if (_checkbox) {
                                        if (!signup.currentState.validate()) {
                                          print("Error Format");
                                        } else {
                                          var isRegistered =
                                              await Provider.of<UserViewModel>(
                                            context,
                                            listen: false,
                                          ).register(
                                            User(
                                              firstName:
                                                  FirstNameController.text,
                                              lastName: LastNameController.text,
                                              email: EmaiAdressController.text,
                                              phone: PhoneNumberController.text,
                                              password: PasswordController.text,
                                              company_name:
                                                  CompanyNameController.text,
                                              // profilePicture: ProfilePicture(
                                              //     path: _imageFile.path),
                                            ),
                                          );
                                          if (isRegistered) {
                                            Fluttertoast.showToast(
                                              msg: "Account Created",
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
                                                    VerficationCode(
                                                  phoneNumber:
                                                      "20-${PhoneNumberController.text}",
                                                ),
                                              ),
                                            );
                                          } else {
                                            Fluttertoast.showToast(
                                              msg: "Already Exist",
                                              toastLength: Toast.LENGTH_SHORT,
                                              gravity: ToastGravity.BOTTOM,
                                              timeInSecForIosWeb: 1,
                                              backgroundColor: Colors.black,
                                              textColor: Colors.white,
                                              fontSize: 16.0,
                                            );
                                          }
                                        }
                                      } else {
                                        SnackBar snackBar = SnackBar(
                                          content: Text(
                                            'You Have To Accept Terms and Conditions',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          duration: Duration(seconds: 1),
                                          backgroundColor: Colors.grey,
                                        );

                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(snackBar);
                                      }

                                      //todo login method
                                      //
                                      // Provider.of<UserViewModel>(
                                      //   context,
                                      //   listen: false,
                                      // ).login(
                                      //   // phoneNumber: "20-1118240000",
                                      //   email: "bank@intcore.net3",
                                      //   password: "123123",
                                      // );
                                    },
                                    child: Text(
                                      'Sign Up',
                                      style: TextStyle(
                                        // fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        fontFamily: 'Segoe-UI',
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
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  void imageProfile(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: ((builder) => bottomSheet()),
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 200,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 20,
      ),
      child: Column(
        children: [
          Text(
            'Choose Profile Photo',
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlatButton.icon(
                onPressed: () {
                  takePhoto(ImageSource.camera);
                },
                icon: Icon(Icons.camera_alt_outlined),
                label: Text('Camera'),
              ),
              SizedBox(
                height: 20,
              ),
              FlatButton.icon(
                onPressed: () {
                  takePhoto(
                    ImageSource.gallery,
                  );
                },
                icon: Icon(Icons.image),
                label: Text('Galary'),
              )
            ],
          )
        ],
      ),
    );
  }

  void takePhoto(ImageSource source) async {
    final pickedFile = await _picker.getImage(source: source);
    setState(() {
      _imageFile = pickedFile;
    });
  }
}
