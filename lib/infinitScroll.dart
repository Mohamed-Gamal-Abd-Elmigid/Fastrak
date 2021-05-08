import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:loginscreen/Model/notification.dart';
import 'package:http/http.dart' as http;

class InfinitScroll extends StatefulWidget {
  const InfinitScroll({Key key}) : super(key: key);

  @override
  _InfinitScrollState createState() => _InfinitScrollState();
}

class _InfinitScrollState extends State<InfinitScroll> {
  List<NotificationOne> notifications;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test Notifications'),
        actions: [
          IconButton(
            onPressed: fetch,
            icon: Icon(
              Icons.notification_important,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            trailing: Column(
              children: [
                Text(
                  DateFormat('jm').format(notifications[index].createdAt),
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                Text(
                  // '${mmmm[index].createdAt}',
                  DateFormat('yyyy/MM/dd')
                      .format(notifications[index].createdAt),
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                  // DateFormat.YEAR_ABBR_MONTH_WEEKDAY_DAY,
                  // DateFormat.YEAR().format(tx.data),
                ),
              ],
            ),
            leading: Container(
              height: 50.0,
              width: 50.0,
              decoration: BoxDecoration(
                // image: DecorationImage(
                //   image: AssetImage("assets/face.png"),
                //   fit: BoxFit.cover,
                // ),
                borderRadius: BorderRadius.circular(15),
                color: Colors.grey,
              ),
            ),
            title: Text(
              '${notifications[index].data.title}',
              // 'Notificatioin Titles',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              '${notifications[index].data.body}',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            onTap: () {},
            enabled: true,
          );
        },
      ),
    );
  }

  fetch() async {
    String token =
        "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiZDM0OTQxNWI0ZDM1ZDFlY2VhZDM0Nzk4ZjZhMTZiMmM5MmI2NGU1ZDQ0NmZjYTMzOWJhZDAxNGMyZTcxNmNiZjczNmY5MzNiNjVjZGI3NGQiLCJpYXQiOjE2MTk3MDMzOTEsIm5iZiI6MTYxOTcwMzM5MSwiZXhwIjoxNjUxMjM5MzkxLCJzdWIiOiI2ZWRjNjQwNy0wMjdmLTRlMzAtYjY4OS1jZDgxNDBiYTJmZDQiLCJzY29wZXMiOltdfQ.YL04XdOxAileorKQV3vZKTzfkoY6pO2NzlFnBFQseMO0AbuStwjoj7qwGm9n2d2_RBzKrQeo2COOxh7X4GIn2ne7KbgWLDmt8NddW4pbAlmXOqYbYa4IBPeF2cTOiCZHJ85sL7OLMUm0T5j0qnr4QfyuY5Gey0G4JAgB8CHUnjO2xmhOoutIfUecdIaY9yCdreT4sVTmgQ0TYVNOQIZD4UJvmirCnAnRqe1GLyknXqIINpTqq-SZLtdMGyWIoI9ut1ejVOBz6o2mSmASVcd0LSO3VAd-XSbFdhOaw6PJk8vtOOA0DUROmCMRIHGyoI6B6vpQ3dB2eXDFdmw3aeIv8msV_zM0_PAulaTyJt6gmc9kCf1bV-Z9dXeZUuAViZvV7LlzE8vBmcdm6K9bKnUdAsa13RgLG2hcbsW-oRAApPYX4JpKn9TW3PL5R_C5xdqiPWMR6tBG1bxuUjEvQ0TGWY6s6Gh-7xRf6YhMtLlBiPwbBYp9zP0qlwoxtandGOXcHagNIryyOX1-puwLt3weq3rpy3ENl-uCMTdn0A2ghGNJEl0sYgEQ_naNYU8rCg2XMivtrfHG_UB8zy0HYV3gjIVvTTu7ihD71kj4iS93ScgDZ3xAzchPYtJpb_hhHi9r7HAF6WLk2IaJk-i5sJDRkEayGPAAtK76iow2CfxhF9E";

    Map<String, String> header = {
      "Accept": "application/json",
      "Accept-Language": "en",
      "Authorization": "Bearer  ${token}",
    };

    var url =
        'http://3.126.221.243:8080/api/v1/app/notifications?page=/api/v1/app/notifications?page=1';
    Uri uri = Uri.parse(url);
    http.Response response = await http.get(
      uri,
      headers: header,
    );

    if (response.statusCode == 200) {
      setState(() {
        notifications.add(json.decode(response.body)['notifications']);
      });
    } else {
      print("Error In Scroll Area Notifications");
    }
  }

  fetchFive() {
    for (int i = 0; i < 5; i++) {
      fetch();
    }
  }
}
