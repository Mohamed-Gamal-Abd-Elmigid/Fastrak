import 'package:flutter/material.dart';
import 'package:loginscreen/viewmodel/userviewmodel.dart';
import 'package:provider/provider.dart';

class EnterPassword extends StatefulWidget {
  @override
  _EnterPasswordState createState() => _EnterPasswordState();
}

class _EnterPasswordState extends State<EnterPassword> {
  final passwordKey = GlobalKey<FormState>();

  TextEditingController PhoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          // title: Image('assets/logo.png'),You can add title here
          title: Image(
            image: AssetImage(
              'assets/logo.png',
            ),
            width: MediaQuery.of(context).size.width * 0.35,
            height: MediaQuery.of(context).size.height * 0.066,
          ),

          backgroundColor:
              Colors.blue.withOpacity(0), //You can make this transparent
          elevation: 0.0, //No shadow
        ),
        backgroundColor: Color.fromRGBO(249, 250, 255, 20),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.884,
              height: MediaQuery.of(context).size.height * 0.813,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.032,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.768,
                    height: MediaQuery.of(context).size.height * 0.354,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image(
                      image: AssetImage('assets/profile.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.032,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 40,
                    ),
                    height: MediaQuery.of(context).size.height * 0.040,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 30,
                          child: Text(
                            'ENTER YOUR PASSWORD',
                            style: TextStyle(
                              fontFamily: 'SegoeUI',
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                          ),
                        ),
                        Container(
                          // padding: EdgeInsets.only(top: 10),
                          height: 4.0,
                          color: Colors.black,
                          width: MediaQuery.of(context).size.width / 8,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5.0, left: 10, right: 10),
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
                        Row(
                          children: [
                            Expanded(
                              child: Form(
                                key: passwordKey,
                                child: TextFormField(
                                  controller: PhoneNumberController,
                                  decoration: InputDecoration(
                                    prefixIcon: Container(
                                      width:
                                          MediaQuery.of(context).size.width / 5,
                                      child: Row(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.only(right: 10),
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
                                        EdgeInsets.symmetric(vertical: 20),
                                    hintText: '11234567890',
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.teal,
                                      ),
                                      borderRadius: const BorderRadius.all(
                                        const Radius.circular(10.0),
                                      ),
                                    ),
                                  ),
                                  keyboardType: TextInputType.number,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return "Requird";
                                    } else if (value.length != 10) {
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
                          // width: double.maxFinite,
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.058,
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                if (!passwordKey.currentState.validate()) {
                                  print("Error Format");
                                  return;
                                } else {
                                  Provider.of<UserViewModel>(
                                    context,
                                    listen: false,
                                  ).login(
                                    phoneNumber:
                                        ("20-${PhoneNumberController.text}"),
                                    // email: "bank@intcore.net3",
                                    password: "123123",
                                  );
                                }
                              });
                            },
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.deepPurple,
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
                                    child: new RaisedButton(
                                      elevation: 0.0,
                                      shape: new RoundedRectangleBorder(
                                          borderRadius:
                                              new BorderRadius.circular(10.0)),
                                      padding: EdgeInsets.only(
                                        top: 7.0,
                                        bottom: 7.0,
                                        right: 20,
                                        left: 7.0,
                                      ),
                                      onPressed: () {},
                                      child: new Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          new Image.asset('assets/face.png',
                                              height: 30.0, width: 30.0),
                                          Padding(
                                            padding:
                                                EdgeInsets.only(left: 10.0),
                                            child: new Text(
                                              "facebook",
                                              style: TextStyle(
                                                fontSize: 20.0,
                                                color: Colors.grey.shade600,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      textColor: Color(0xFF292929),
                                      color: Colors.grey.shade200,
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
                                    // height: MediaQuery.of(context).size.height *
                                    //     0.058,
                                    child: new RaisedButton(
                                      elevation: 0.0,
                                      shape: new RoundedRectangleBorder(
                                          borderRadius:
                                              new BorderRadius.circular(10.0)),
                                      padding: EdgeInsets.only(
                                        top: 7.0,
                                        bottom: 7.0,
                                        right: 20,
                                        left: 7.0,
                                      ),
                                      onPressed: () {},
                                      child: new Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          new Image.asset('assets/google.png',
                                              height: 30.0, width: 30.0),
                                          Padding(
                                            padding:
                                                EdgeInsets.only(left: 10.0),
                                            child: new Text(
                                              "Google",
                                              style: TextStyle(
                                                fontSize: 20.0,
                                                color: Colors.grey.shade600,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      textColor: Color(0xFF292929),
                                      color: Colors.grey.shade200,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.058,
                      child: RaisedButton(
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(10.0)),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Continue As Guest',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
