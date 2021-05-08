import 'package:flutter/material.dart';
import 'package:loginscreen/Model/notification.dart';
import 'package:loginscreen/viewmodel/userviewmodel.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController _scrollController = new ScrollController();
  int _page = 1;
  bool isLoading = false;

  List<NotificationOne> notefication;

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
  }

  @override
  void initState() {
    super.initState();

    var videosBloc = Provider.of<UserViewModel>(context, listen: false);
    videosBloc.resetStreams();
    videosBloc.fetchAllUsers(_page);

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        videosBloc.setLoadingState(LoadMoreStatus.LOADING);
        videosBloc.fetchAllUsers(++_page);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Infinite Scrolling"),
        actions: [
          IconButton(
            onPressed: fetchNotificaion,
            icon: Icon(
              Icons.notification_important,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: Consumer<UserViewModel>(
        builder: (context, usersModel, child) {
          if (usersModel.allUsers != null && usersModel.allUsers.length > 0) {
            return _listView(usersModel);
          }

          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget _listView(UserViewModel dataProvider) {
    return ListView.separated(
      itemCount: dataProvider.allUsers.length,
      controller: _scrollController,
      shrinkWrap: true,
      physics: const AlwaysScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        if ((index == dataProvider.allUsers.length - 1) &&
            dataProvider.allUsers.length < dataProvider.totalRecords) {
          return Center(child: CircularProgressIndicator());
        }

        return _buildRow(dataProvider.allUsers[index]);
      },
      separatorBuilder: (context, index) {
        return Divider();
      },
    );
  }

  Widget _buildRow(NotificationOne radioModel) {
    return ListTile(title: new Text(radioModel.data.title));
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
