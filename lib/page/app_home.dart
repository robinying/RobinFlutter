import 'package:flutter/material.dart';
import 'package:robin_app/utils/navigator_utils.dart';
import 'package:robin_app/page/search.dart';
import 'package:robin_app/page/more_info.dart';
import 'package:oktoast/oktoast.dart';
import 'package:robin_app/page/camera_screen.dart';
import 'package:robin_app/page/chat_screen.dart';
import 'package:robin_app/page/status_screen.dart';
import 'package:robin_app/page/call_screen.dart';
import 'package:robin_app/page/home_drawer.dart';

class AppHome extends StatefulWidget {
  var cameras;

  AppHome(this.cameras);

  @override
  _AppHomeState createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> with SingleTickerProviderStateMixin {
  TabController _tabController;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(initialIndex: 1, length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return new OKToast(
        child: Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Robin App"),
        bottom: new TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          tabs: <Widget>[
            new Tab(icon: Icon(Icons.camera_alt)),
            new Tab(icon: Icon(Icons.chat)),
            new Tab(
              text: "STATUS",
            ),
            new Tab(
              text: "CALLS",
            ),
          ],
        ),
        leading: new IconButton(
          icon: new Container(
            padding: EdgeInsets.all(3.0),
            child: new CircleAvatar(
              radius: 40.0,
              backgroundImage: AssetImage("assets/images/drawer.png"),
            ),
          ),
          onPressed: () {
            showToast(
              "drawer pressed",
              duration: Duration(seconds: 2),
              position: ToastPosition.bottom,
              backgroundColor: Colors.black.withOpacity(0.8),
              radius: 13.0,
              textStyle: TextStyle(fontSize: 18.0),
            );
          },
        ),
        actions: <Widget>[
          new IconButton(
              icon: new Icon(Icons.search),
              tooltip: '搜索',
              onPressed: () {
                NavigatorUtils.intentToPage(context, new SearchPage(),
                    pageName: "SearchPage");
              }),
          new Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
          ),
          new IconButton(
            icon: new Icon(Icons.more_vert),
            tooltip: '更多',
            onPressed: () {
              NavigatorUtils.intentToPage(context, new MoreInfoPage(),
                  pageName: "More");
            },
          )
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          new CameraScreen(widget.cameras),
          new ChatScreen(),
          new StatusScreen(),
          new CallsScreen(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).accentColor,
        child: new Icon(
          Icons.message,
          color: Colors.greenAccent,
        ),
        onPressed: () => showToast(
              "Chat Message",
              duration: Duration(seconds: 2),
              position: ToastPosition.bottom,
              backgroundColor: Colors.black.withOpacity(0.8),
              radius: 13.0,
              textStyle: TextStyle(fontSize: 18.0),
            ),
      ),
          drawer: new Drawer(
            child: new HomeDrawerPage(),
          ),
    ));
  }
}
