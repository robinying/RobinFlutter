import 'package:flutter/material.dart';
import 'package:robin_app/page/chat_screen.dart';
import 'package:robin_app/utils/navigator_utils.dart';
import 'package:robin_app/utils/common_utils.dart';
import 'package:robin_app/page/user_profile_page.dart';
import 'package:robin_app/page/top_player_page.dart';

class HomeDrawerPage extends StatefulWidget {
  @override
  _HomeDrawerPageState createState() => _HomeDrawerPageState();
}
// 侧滑栏的菜单项
class _NavigationMenuItem {
  String titleId;
  IconData itemIcon;
  Widget purposePage;
  _NavigationMenuItem(this.titleId, this.itemIcon, this.purposePage);
}

class _HomeDrawerPageState extends State<HomeDrawerPage> {
  List<_NavigationMenuItem> _navigationMenuData ;

  @override
  void initState() {
    super.initState();
    _navigationMenuData = [
      new _NavigationMenuItem("热门", Icons.whatshot, new TopPlayersPage()),
      new _NavigationMenuItem("新闻", Icons.public, new ChatScreen()),
      new _NavigationMenuItem("设置", Icons.settings, new ChatScreen()),
      new _NavigationMenuItem("分享", Icons.share, new ChatScreen()),
      new _NavigationMenuItem("关于", Icons.info, new ChatScreen()),
      new _NavigationMenuItem("退出", Icons.exit_to_app, new ChatScreen()),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Column(
        children: <Widget>[
          new Container(
            child: new Column(
              children: <Widget>[
                new Container(
                  margin: EdgeInsets.only(top: CommonUtil.getStatusBarHeight(context)+10, left: 12.0),
                  width: 80.0,
                  height: 80.0,
                  child: new IconButton(
                      icon: new CircleAvatar(
                          radius: 40.0,
                          backgroundImage: AssetImage("assets/images/cat_head.jpg")
                      ),
                      onPressed: () {
                        NavigatorUtils.intentToPage(context, new UserProfilePage(), pageName: "UserProfilePage");
                      }
                  ),
                ),
                new Padding(
                    padding: EdgeInsets.only(left: 18.0, top: 6.0),
                    child: new Text(
                        "云淡风轻",
                        style : new TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.white,
                        )
                    )
                ),
                new Padding(
                    padding: EdgeInsets.only(left: 18.0, top: 6.0, bottom: 16.0),
                    child: new Text(
                        "Life is a long practice, just keep running～",
                        style : new TextStyle(
                          fontSize: 14,
                          color: Colors.white70,
                        )
                    )
                )

              ],
              crossAxisAlignment: CrossAxisAlignment.start,
            ),
            color: Theme.of(context).primaryColor,
            width: double.infinity,
          ),
          new Expanded(
              child: new ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: _navigationMenuData.length,
                  itemBuilder: (BuildContext context, int index){
                    return new ListTile(
                      leading: new Icon(_navigationMenuData[index].itemIcon),
                      title: new Text( _navigationMenuData[index].titleId),
                      onTap: (){
                        if (index != 5){
                          NavigatorUtils.intentToPage(context, _navigationMenuData[index].purposePage, pageName: _navigationMenuData[index].titleId);
                        }else {
                          print("退出");
                        }
                      },
                    );
                  }
              )
          )


        ],
      ),
    );
  }
}
