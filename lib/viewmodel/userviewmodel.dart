import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:loginscreen/Model/user.dart';
import 'package:http/http.dart' as http;

final baseUrl = 'http://3.126.221.243:8080';

class UserViewModel extends ChangeNotifier {
  User currentUser;

  Future<bool> register(User myUser) async {
    Map<String, String> header = {
      "Accept": "application/json",
      "Accept-Language": "en",
    };

    // Dio dio = Dio();
    // // http.Response futurePost = await http.get(uuuri, headers: header);
    // final response = await dio.post(
    //   '$baseUrl$regist',
    //   data: FormData.fromMap(
    //     myUser.registerToJson(),
    //   ),
    //   options: Options(
    //     headers: header,
    //   ),
    // );

    // Map<String, String> body = {
    //   "first_name": myUser.firstName,
    //   "last_name": myUser.lastName,
    //   "email": myUser.email,
    //   "phone": myUser.phone,
    // };

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

    print(" Test TestTestTestTestTestTest");
    print(response.body);
    print("this is Token");
    var token = json.decode(response.body)["data"]["access_token"];
    print(token);

    notifyListeners();

    return true;
  }

  Future<bool> login({String phoneNumber, String password}) async {
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

    print(" Test What Back From Login");
    print(response.body);

    var token = json.decode(response.body)["data"]["access_token"];
    print("this is My Token");

    print(token);
    currentUser = User.fromJson(
      jsonDecode(response.body),
    );

    notifyListeners();
    return true;
  }
}
