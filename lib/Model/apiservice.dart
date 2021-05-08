import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:loginscreen/Model/notification.dart';

// import 'models/data_model.dart';

class APIService {
  Future<NotificationsData> getData(String token, pageNumber) async {
    String url =
        "http://3.126.221.243:8080/api/v1/app/notifications?page=$pageNumber";

    print("URL : $url");
    Map<String, String> header = {
      "Accept": "application/json",
      "Accept-Language": "en",
      "Authorization": "Bearer  ${token}",
    };

    Uri uri = Uri.parse(url);
    http.Response response = await http.get(
      uri,
      headers: header,
    );
    if (response.statusCode == 200) {
      return NotificationsData.fromJson(
        json.decode(response.body),
      );
    } else {
      throw Exception('Failed to load data!');
    }
  }
}
