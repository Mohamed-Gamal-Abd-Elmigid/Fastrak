import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:loginscreen/Home.dart';
import 'package:loginscreen/Model/notification.dart';
import 'package:loginscreen/loading.dart';
import 'package:loginscreen/viewmodel/userviewmodel.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/cupertino.dart';

class NotificationFastrak extends StatefulWidget {
  @override
  _NotificationFastrakState createState() => _NotificationFastrakState();
}

class _NotificationFastrakState extends State<NotificationFastrak> {
  var _blankFocusNode = new FocusNode();

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  // ScrollController _scrollController = new ScrollController();

  List<NotificationOne> notefication;

  List<NotificationOne> mmmm;

  List<Pagination> yyyy;

  List<Pagination> zzz;

  bool isLoading = false;

  String token;
  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var comming = preferences.getString("token");
    setState(() {
      token = comming;
      isLoading = true;
    });
  }

  fetchNotificaion() async {
    notefication = await Provider.of<UserViewModel>(
      context,
      listen: false,
    ).Notifications(token, true);
    setState(() {
      mmmm = notefication;
      isLoading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPref();
    setState(() => isLoading = true);
    fetchNotificaion();

    // _scrollController.addListener(() {
    //   if (_scrollController.position.pixels ==
    //       _scrollController.position.maxScrollExtent) {
    //     _onLoading();
    //   }
    // });
  }

  void _onRefresh() async {
    // monitor network fetch
    Provider.of<UserViewModel>(context, listen: false)
        .Notifications(token, true);
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }

  List<NotificationOne> result = [];

  void _onLoading() async {
    result = await Provider.of<UserViewModel>(context, listen: false)
        .Notifications(token, false);
    // monitor network fetch

    _refreshController.loadComplete();
  }

  // getMoreData() {
  //   print("WHy");
  //   setState(() {
  //     CircularProgressIndicator();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
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
          actions: [
            IconButton(
              onPressed: fetchNotificaion,
              icon: Icon(
                Icons.notification_important,
                color: Colors.black,
              ),
            )
          ],
          leading: new IconButton(
            icon: new Icon(
              Icons.arrow_back_outlined,
              color: Colors.black,
              size: MediaQuery.of(context).size.width * 0.07,
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => Home(),
                ),
              );
            },
          ),
          backgroundColor: Color(0xFFF9FAFF), //You can make this transparent
          elevation: 0.0, //No shadow
        ),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(_blankFocusNode);
          },
          child: SafeArea(
            child: Container(
              color: Color(0xFFF9FAFF),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 100,
                    child: Text(
                      'Notifications',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  // Container(
                  //   alignment: Alignment.center,
                  //   height: 100,
                  //   child: RaisedButton(
                  //     child: Text('Test Notification'),
                  //     onPressed: () async {
                  //       print("Hello");
                  //       // fetchNotificaion();
                  //
                  //       // print(
                  //       //   jsonEncode(zzz),
                  //       // );
                  //       // print(jsonEncode(mmmm[0].data.title));
                  //
                  //       // print("This is Error");
                  //       // print(result);
                  //       // setState(() {
                  //       //   notefication = result;
                  //       // });
                  //       // print("This is Error");
                  //
                  //       // setState(() {
                  //       //   notefication = result;
                  //       // });
                  //     },
                  //   ),
                  // ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 5, right: 5),
                      child: isLoading
                          ? Loading()
                          : Consumer<UserViewModel>(
                              builder: (context, value, child) {
                                return SmartRefresher(
                                  enablePullDown: true,
                                  enablePullUp: true,
                                  header: WaterDropHeader(),
                                  footer: CustomFooter(
                                    builder: (BuildContext context,
                                        LoadStatus mode) {
                                      Widget body;
                                      // if (mode == LoadStatus.idle) {
                                      //   body = Text("pull up load");
                                      // } else
                                      if (mode == LoadStatus.loading) {
                                        body = CircularProgressIndicator();
                                      } else if (mode == LoadStatus.failed) {
                                        body = Text("Load Failed!Click retry!");
                                      }
                                      //   else
                                      //   if (mode ==
                                      //     LoadStatus.canLoading) {
                                      //   body = Text('Release to load more');
                                      // }
                                      else {
                                        body = (result.length == 0)
                                            ? Text("No More Data")
                                            : Text("LOad MORE MORE ");
                                      }
                                      return Container(
                                        height: 55.0,
                                        child: Center(child: body),
                                      );
                                    },
                                  ),
                                  controller: _refreshController,
                                  onRefresh: _onRefresh,
                                  onLoading: _onLoading,
                                  child: ListView.separated(
                                    itemCount: value.mmmm.length,
                                    physics: ClampingScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      return ListTile(
                                        trailing: Column(
                                          children: [
                                            Text(
                                              DateFormat('jm').format(
                                                  value.mmmm[index].createdAt),
                                              style: TextStyle(
                                                color: Colors.grey,
                                              ),
                                            ),
                                            Text(
                                              // '${mmmm[index].createdAt}',
                                              DateFormat('yyyy/MM/dd').format(
                                                  value.mmmm[index].createdAt),
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
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            color: Colors.grey,
                                          ),
                                        ),
                                        title: Text(
                                          '${value.mmmm[index].data.title}',
                                          // 'Notificatioin Titles',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        subtitle: Text(
                                          '${value.mmmm[index].data.body}',
                                          style: TextStyle(
                                            color: Colors.black,
                                          ),
                                        ),
                                        onTap: () {},
                                        enabled: true,
                                      );
                                    },
                                    separatorBuilder: (context, index) {
                                      return Divider(
                                        color: Colors.black,
                                      );
                                    },
                                  ),
                                );
                              },
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
