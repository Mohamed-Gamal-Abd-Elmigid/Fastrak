// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:loginscreen/Model/user.dart';
// import 'package:flutter/material.dart';
// import 'package:dio/dio.dart';
//
// final baseUrl = 'http://3.126.221.243:8080';
// final regist = "/api/v1/user/auth/regular/register";
//
// Future<bool> register(User myUser) async {
//   Map<String, String> header = {
//     "Accept": "application/json",
//     "Accept-Language": "en",
//   };
//
//   Map<String, String> body = {
//     "first_name": myUser.firstName,
//     "last_name": myUser.lastName,
//     "email": myUser.email,
//     "phone": myUser.phone,
//   };
//
//   print(jsonEncode(
//     myUser.toJson(),
//   ));
//
//   Dio dio = Dio();
//   // http.Response futurePost = await http.get(uuuri, headers: header);
//   final response = await dio.post(
//     '$baseUrl$regist',
//     data: FormData.fromMap(body),
//     options: Options(
//       headers: header,
//     ),
//   );
//
//   print("Mohamed Test");
//   print(response.data);
//   return true;

// jsonEncode(myUser.toJson())

// if (futurePost.statusCode == 200) {
//   print(futurePost.body);
//   //sucess
//
//   var token = jsonDecode(futurePost.body)["token"];
//
//   // SharedPreferences preferences = await SharedPreferences.getInstance();
//   //
//   // var title = await Login(myUser.email, myUser.password);
//   //
//   // var email = await Login(myUser.email, myUser.password);
//
//   preferences.setString("username", title);
//   preferences.setString("email", email);
//   preferences.setString("token", token);
//
//   return true; // Sucess
// } else {
//   print(futurePost.body);
//   return false; // Email IS Already Exist
//   // throw Exception('can not load post data');
// }
// }
