import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:loginscreen/Model/apiservice.dart';
import 'package:loginscreen/Model/error.dart';
import 'package:loginscreen/Model/notification.dart';
import 'package:loginscreen/Model/notification.dart';
import 'package:loginscreen/Model/notification.dart';
import 'package:loginscreen/Model/notification.dart';
import 'package:loginscreen/Model/user.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

final baseUrl = 'http://3.126.221.243:8080';
enum RegistrationResult { AccountCreated, EmailAlreadyTaken, PhoneAlreadyTaken }

enum LoadMoreStatus { LOADING, STABLE }

class UserViewModel extends ChangeNotifier {
  APIService _apiService;
  NotificationsData _dataFetcher;
  int totalPages = 0;
  int pageSize = 15;

  List<NotificationOne> get allUsers => _dataFetcher.notifications;
  int get totalRecords => _dataFetcher.pagination.total;

  LoadMoreStatus _loadMoreStatus = LoadMoreStatus.STABLE;
  getLoadMoreStatus() => _loadMoreStatus;

  DataProvider() {
    _initStreams();
  }

  void _initStreams() {
    _apiService = APIService();
    _dataFetcher = NotificationsData();
  }

  void resetStreams() {
    _initStreams();
  }

  fetchAllUsers(pageNumber) async {
    if ((totalPages == 0) || pageNumber <= totalPages) {
      NotificationsData itemModel = await _apiService.getData(
          "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiZDM0OTQxNWI0ZDM1ZDFlY2VhZDM0Nzk4ZjZhMTZiMmM5MmI2NGU1ZDQ0NmZjYTMzOWJhZDAxNGMyZTcxNmNiZjczNmY5MzNiNjVjZGI3NGQiLCJpYXQiOjE2MTk3MDMzOTEsIm5iZiI6MTYxOTcwMzM5MSwiZXhwIjoxNjUxMjM5MzkxLCJzdWIiOiI2ZWRjNjQwNy0wMjdmLTRlMzAtYjY4OS1jZDgxNDBiYTJmZDQiLCJzY29wZXMiOltdfQ.YL04XdOxAileorKQV3vZKTzfkoY6pO2NzlFnBFQseMO0AbuStwjoj7qwGm9n2d2_RBzKrQeo2COOxh7X4GIn2ne7KbgWLDmt8NddW4pbAlmXOqYbYa4IBPeF2cTOiCZHJ85sL7OLMUm0T5j0qnr4QfyuY5Gey0G4JAgB8CHUnjO2xmhOoutIfUecdIaY9yCdreT4sVTmgQ0TYVNOQIZD4UJvmirCnAnRqe1GLyknXqIINpTqq-SZLtdMGyWIoI9ut1ejVOBz6o2mSmASVcd0LSO3VAd-XSbFdhOaw6PJk8vtOOA0DUROmCMRIHGyoI6B6vpQ3dB2eXDFdmw3aeIv8msV_zM0_PAulaTyJt6gmc9kCf1bV-Z9dXeZUuAViZvV7LlzE8vBmcdm6K9bKnUdAsa13RgLG2hcbsW-oRAApPYX4JpKn9TW3PL5R_C5xdqiPWMR6tBG1bxuUjEvQ0TGWY6s6Gh-7xRf6YhMtLlBiPwbBYp9zP0qlwoxtandGOXcHagNIryyOX1-puwLt3weq3rpy3ENl-uCMTdn0A2ghGNJEl0sYgEQ_naNYU8rCg2XMivtrfHG_UB8zy0HYV3gjIVvTTu7ihD71kj4iS93ScgDZ3xAzchPYtJpb_hhHi9r7HAF6WLk2IaJk-i5sJDRkEayGPAAtK76iow2CfxhF9E",
          pageNumber);
      if (_dataFetcher.notifications == null) {
        totalPages = ((itemModel.pagination.total - 1) / pageSize).ceil();
        _dataFetcher = itemModel;
      } else {
        _dataFetcher.notifications.addAll(itemModel.notifications);
        _dataFetcher = _dataFetcher;

        // One load more is done will make it status as stable.
        setLoadingState(LoadMoreStatus.STABLE);
      }

      notifyListeners();
    }

    if (pageNumber > totalPages) {
      // One load more is done will make it status as stable.
      setLoadingState(LoadMoreStatus.STABLE);
      notifyListeners();
    }
  }

  setLoadingState(LoadMoreStatus loadMoreStatus) {
    _loadMoreStatus = loadMoreStatus;
    notifyListeners();
  }

  User currentUser;
  bool isFound;
  String message;
  List<NotificationOne> mmmm = [];
  int page = 1;

  List<Pagination> yyyy = [];

  Future<bool> register(User myUser) async {
    bool isRegisterd;

    Map<String, String> header = {
      "Accept": "application/json",
      "Accept-Language": "en",
    };

    Map<String, String> Profile = {
      "id": " ",
      // "path": myUser.profilePicture.path,
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

      print(result);
      message = result;
      isRegisterd = false;
    }
    notifyListeners();
    return isRegisterd;
  }

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
      var error = json.decode(response.body)["errors"][0]["message"];
      print(error);
      isLogIn = false;
    }

    currentUser = User.fromJson(
      jsonDecode(response.body),
    );

    notifyListeners();
    return isLogIn;
  }

  // Check user already Exist
  Future<bool> check(String phone) async {
    Map<String, String> header = {
      "Accept": "application/json",
      "Accept-Language": "en",
    };

    Map<String, String> body = {
      "phone": phone == null ? null : phone,
    };
    var url = '$baseUrl/api/v1/user/auth/regular/check-user';
    Uri uri = Uri.parse(url);
    http.Response response = await http.post(
      uri,
      headers: header,
      body: body,
    );

    print(" Test Already Exist APi");
    if (response.statusCode == 200) {
      print(response.body);
      var result = json.decode(response.body)["data"]["is_exist"];
      print(result);
      print(response.statusCode);
      isFound = true;
    } else {
      print(response.body);
      print(response.statusCode);
      var result = json.decode(response.body)["errors"][0]["message"];
      print(result);
      isFound = false;
    }

    notifyListeners();

    return isFound;
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
    if (response.statusCode == 200) {
      print(response.body);
      print(response.statusCode);
      isFound = true;
    } else {
      print(response.body);
      // var body = json.decode(response.body);
      // print(body);
      print(response.statusCode);

      isFound = false;
    }

    notifyListeners();

    return isFound;
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

  //For Resend otp in regiteration
  Future<bool> resendOtp(String token) async {
    Map<String, String> header = {
      "Accept": "application/json",
      "Accept-Language": "en",
      "Authorization": "Bearer ${token}",
    };

    var url = '$baseUrl/api/v1/user/auth/activate';
    Uri uri = Uri.parse(url);
    http.Response response = await http.post(
      uri,
      headers: header,
    );

    print(" Test Resend OTP");
    print(response.body);
    print("this is the OTP STATUS Code");
    print(response.statusCode);

    currentUser = User.fromJson(
      jsonDecode(response.body),
    );

    notifyListeners();
    return true;
  }

  //For Logout

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

  //login with facebook

  // Future<Null> _login() async {
  //   final FacebookLoginResult result = await facebookSignIn.logIn(['email']);
  //
  //   switch (result.status) {
  //     case FacebookLoginStatus.loggedIn:
  //       final FacebookAccessToken accessToken = result.accessToken;
  //       _showMessage('''
  //        Logged in!
  //
  //        Token: ${accessToken.token}
  //        User id: ${accessToken.userId}
  //        Expires: ${accessToken.expires}
  //        Permissions: ${accessToken.permissions}
  //        Declined permissions: ${accessToken.declinedPermissions}
  //        ''');
  //       break;
  //     case FacebookLoginStatus.cancelledByUser:
  //       _showMessage('Login cancelled by the user.');
  //       break;
  //     case FacebookLoginStatus.error:
  //       _showMessage('Something went wrong with the login process.\n'
  //           'Here\'s the error Facebook gave us: ${result.errorMessage}');
  //       break;
  //   }
  // }

  //logout with facebook

  // Future<Null> _logOut() async {
  //   await facebookSignIn.logOut();
  //   _showMessage('Logged out.');
  // }

  Future<List<NotificationOne>> Notifications(
      String token, bool refresh) async {
    Map<String, String> header = {
      "Accept": "application/json",
      "Accept-Language": "en",
      "Authorization": "Bearer  ${token}",
    };

    if (refresh) {
      mmmm = [];
      page = 1;
    }

    var url = '$baseUrl/api/v1/app/notifications?page=$page';
    Uri uri = Uri.parse(url);
    http.Response response = await http.get(
      uri,
      headers: header,
    );

    List<NotificationOne> test = [];
    List result;

    if (response.statusCode == 200) {
      print(" Test Notifications IS DOne");

      result = json.decode(response.body)["data"]["notifications"];

      test = result.map((item) {
        // print(jsonEncode(NotificationOne.fromJson(item)));
        return NotificationOne.fromJson(item);
      }).toList() as List<NotificationOne>;

      // print(result);

      // NotificationOne.fromJson(
      //     json.decode(response.body)["data"]["notifications"]);
      // print(response.statusCode);
    } else {
      print("Come From Error ");
      print(response.body);
      print(response.statusCode);
      // isFound = false;
    }
    mmmm.addAll(test);

    if (result.length != 0) {
      print("From REfresh What ");
      page++;
    }

    notifyListeners();

    // print("THIS IS LENGHT ${test.length}");
    return test;
  }

  Future<List<Pagination>> pagination(String token, int pageNumber) async {
    Map<String, String> header = {
      "Accept": "application/json",
      "Accept-Language": "en",
      "Authorization": "Bearer  ${token}",
    };

    var url = '$baseUrl/api/v1/app/notifications?page=${pageNumber}';
    Uri uri = Uri.parse(url);
    http.Response response = await http.get(
      uri,
      headers: header,
    );

    var result;
    List<Pagination> test = [];
    if (response.statusCode == 200) {
      print(" Test Pagination Status Code 200");
      result = json.decode(response.body)["data"]['pagination'];
      print(result);
    } else {
      print("Come From Error ");
      print(response.body);
      print(response.statusCode);
      // isFound = false;
    }
    print("berfore Back to scoll");
    print(result);
    notifyListeners();

    return test;
  }
}
