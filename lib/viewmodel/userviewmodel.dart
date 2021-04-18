import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:loginscreen/Model/error.dart';
import 'package:loginscreen/Model/user.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

final baseUrl = 'http://3.126.221.243:8080';
enum RegistrationResult { AccountCreated, EmailAlreadyTaken, PhoneAlreadyTaken }

class UserViewModel extends ChangeNotifier {
  User currentUser;

  Future<bool> register(User myUser) async {
    bool isRegisterd;

    Map<String, String> header = {
      "Accept": "application/json",
      "Accept-Language": "en",
    };

    Map<String, String> Profile = {
      "id": " ",
      "path": myUser.profilePicture.path == null
          ? null
          : myUser.profilePicture.path,
      "path_thumbnail": " ",
      "mime_type": " ",
      "custom_properties": " ",
    };

    Map<String, String> body = {
      "password": myUser.password == null ? null : myUser.password,
      "first_name": myUser.firstName == null ? null : myUser.firstName,
      "last_name": myUser.lastName == null ? null : myUser.lastName,
      "phone": myUser.phone == null ? null : myUser.phone,
      "email": myUser.email == null ? null : myUser.email,
      "company_name": myUser.company_name == null ? null : myUser.company_name,
      "profile_picture": Profile.toString(),
    };
    var url = '$baseUrl/api/v1/user/auth/regular/register';
    Uri uri = Uri.parse(url);
    http.Response response = await http.post(
      uri,
      headers: header,
      body: body,
    );

    if (response.statusCode == 200) {
      print(" Test TestTestTestTestTestTest");
      print(response.body);

      //Save Token To Get The OTP Message
      var token = json.decode(response.body)["data"]["access_token"];
      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setString("token", token);
      var email = json.decode(response.body)["data"]["email"];
      preferences.setString("email", email);
      var phone = json.decode(response.body)["data"]["phone"];
      preferences.setString("phone", phone);

      print("this is Token And Saved Done");
      print(token);
      isRegisterd = true;
    } else {
      print(response.body);

      print("We try print error without Error Type");
      var result = json.decode(response.body)["errors"][0]["message"];

      print("This is Result After Printed");
      print(result);
      isRegisterd = false;
    }
    notifyListeners();
    return isRegisterd;
  }

  //Registeration Using Enumeration
  // Future<RegistrationResult> register(User myUser) async {
  //   Map<String, String> header = {
  //     "Accept": "application/json",
  //     "Accept-Language": "en",
  //   };
  //
  //   Map<String, String> Profile = {
  //     "id": " ",
  //     "path": myUser.profilePicture.path == null
  //         ? null
  //         : myUser.profilePicture.path,
  //     "path_thumbnail": " ",
  //     "mime_type": " ",
  //     "custom_properties": " ",
  //   };
  //
  //   Map<String, String> body = {
  //     "password": myUser.password == null ? null : myUser.password,
  //     "first_name": myUser.firstName == null ? null : myUser.firstName,
  //     "last_name": myUser.lastName == null ? null : myUser.lastName,
  //     "phone": myUser.phone == null ? null : myUser.phone,
  //     "email": myUser.email == null ? null : myUser.email,
  //     "company_name": myUser.company_name == null ? null : myUser.company_name,
  //     "profile_picture": Profile.toString(),
  //   };
  //   var url = '$baseUrl/api/v1/user/auth/regular/register';
  //   Uri uri = Uri.parse(url);
  //   http.Response response = await http.post(
  //     uri,
  //     headers: header,
  //     body: body,
  //   );
  //   RegistrationResult registerResult = null;
  //   if (response.statusCode == 200) {
  //     print(" Test TestTestTestTestTestTest");
  //     print(response.body);
  //
  //     //Save Token To Get The OTP Message
  //     var token = json.decode(response.body)["data"]["access_token"];
  //     SharedPreferences preferences = await SharedPreferences.getInstance();
  //     preferences.setString("access_token", token);
  //
  //     print("this is Token And Saved Done");
  //     print(token);
  //     registerResult = RegistrationResult.AccountCreated;
  //   } else if (response.statusCode == 422) {
  //     print(response.body);
  //
  //     print("We try print error without Error Type");
  //     var result = json.decode(response.body)["errors"];
  //
  //     if (result == "phone") {
  //       print("result From Phone");
  //       print(result);
  //       registerResult = RegistrationResult.PhoneAlreadyTaken;
  //     } else if (result == "email") {
  //       print("Ressult From Email");
  //       var email = json.decode(response.body)["errors"][1];
  //       print(email);
  //       registerResult = RegistrationResult.EmailAlreadyTaken;
  //     }
  //     print("This is Result After Printed");
  //     print(result);
  //   }
  //
  //   notifyListeners();
  //   // print(registerResult);
  //
  //   return registerResult;
  // }

  Future<bool> login({String phoneNumber, String password}) async {
    bool isLogIn;

    Map<String, String> header = {
      "Accept": "application/json",
      "Accept-Language": "en",
    };

    Map<String, String> body = {
      "password": password == null ? null : password,
      "phone": phoneNumber == null ? null : phoneNumber,
    };
    var url = '$baseUrl/api/v1/user/auth/regular/login';
    Uri uri = Uri.parse(url);
    http.Response response = await http.post(
      uri,
      headers: header,
      body: body,
    );

    if (response.statusCode == 200) {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      var token = json.decode(response.body)["data"]["access_token"];
      var email = json.decode(response.body)["data"]["email"];
      preferences.setString("token", token);
      preferences.setString("phone", phoneNumber);
      preferences.setString("email", email);
      print("this is My Token");

      print(token);
      isLogIn = true;
    } else {
      var error = json.decode(response.body)["errors"];
      print(error);
      isLogIn = false;
    }
    print(response.body);

    currentUser = User.fromJson(
      jsonDecode(response.body),
    );

    notifyListeners();
    return isLogIn;
  }

  //Forget PAssword Api

  Future<bool> forgetPassword(User myUser) async {
    Map<String, String> header = {
      "Accept": "application/json",
      "Accept-Language": "en",
    };

    Map<String, String> body = {
      "phone": myUser.phone == null ? null : myUser.phone,
    };
    var url = '$baseUrl/api/v1/user/auth/forget-password/password/request';
    Uri uri = Uri.parse(url);
    http.Response response = await http.post(
      uri,
      headers: header,
      body: body,
    );

    print(" Test Forget PAssword APi");
    print(response.body);
    print(response.statusCode);

    notifyListeners();

    return true;
  }

  //CONFIRM User code as otp came from login
  //String phoneNumber, String code
  Future<bool> confirmUserCode(String phoneNumber, String code) async {
    Map<String, String> header = {
      "Accept": "application/json",
      "Accept-Language": "en",
    };

    Map<String, String> body = {
      "phone": phoneNumber == null ? null : phoneNumber,
      "code": code == null ? null : code,
    };
    var url = '$baseUrl/api/v1/user/auth/forget-password/password/valdiate';
    Uri uri = Uri.parse(url);
    http.Response response = await http.post(
      uri,
      headers: header,
      body: body,
    );

    print(" Test OTP Came From Confirm USer Code ");
    print(response.body);
    // print(phoneNumber);
    print(response.statusCode);

    notifyListeners();

    return true;
  }

  //Setting New Password For User

  Future<bool> newPassword(
      String phoneNumber, String code, String password) async {
    Map<String, String> header = {
      "Accept": "application/json",
      "Accept-Language": "en",
    };

    Map<String, String> body = {
      "phone": phoneNumber == null ? null : phoneNumber,
      "code": code == null ? null : code,
      "password": password == null ? null : password,
    };
    var url = '$baseUrl/api/v1/user/auth/forget-password/password/reset';
    Uri uri = Uri.parse(url);
    http.Response response = await http.post(
      uri,
      headers: header,
      body: body,
    );

    print(" Test New PAssword Api Setting ");
    print(response.body);
    // print(phoneNumber);
    print(response.statusCode);

    notifyListeners();

    return true;
  }

  //For Registeration Form
  Future<bool> OTP(String code, String token) async {
    Map<String, String> header = {
      "Accept": "application/json",
      "Accept-Language": "en",
      "Authorization": "Bearer ${token}",
    };

    Map<String, dynamic> body = {
      "code": "123456",
    };

    var url = '$baseUrl/api/v1/user/auth/activate';
    Uri uri = Uri.parse(url);
    http.Response response = await http.post(
      uri,
      headers: header,
      body: body,
    );

    print(" Test OTP");
    print(response.body);
    print("this is the OTP STATUS Code");
    print(response.statusCode);

    currentUser = User.fromJson(
      jsonDecode(response.body),
    );

    notifyListeners();
    return true;
  }

  Future<bool> logOut(String token) async {
    //Loading The Token

    Map<String, String> header = {
      "Accept": "application/json",
      "Authorization": "Bearer ${token}",
    };

    var url = '$baseUrl/api/v1/user/auth/logout';
    Uri uri = Uri.parse(url);
    http.Response response = await http.post(
      uri,
      headers: header,
    );

    print(" Test LogOut");
    print(response.body);
    print("this is LogOut Status Code");
    print(response.statusCode);

    currentUser = User.fromJson(
      jsonDecode(response.body),
    );

    notifyListeners();
    return true;
  }
}
