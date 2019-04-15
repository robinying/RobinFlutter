import 'package:flutter/material.dart';
import 'package:robin_app/repository/data_repository.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:robin_app/model/top_player_list.dart';
import 'package:robin_app/common/constant.dart';


class TopPlayersPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {

    return new _TopPlayersPageState();
  }

}


class _TopPlayersPageState extends State<TopPlayersPage> {

  final GlobalKey<RefreshIndicatorState> _refreshKey = GlobalKey<RefreshIndicatorState>();
  final repository = new DataRepository();
  List<TopPlayer> topPlayerList = [];
  bool _isFirstRequest   = false;
  ScrollController _controller = new ScrollController();
  /// 默认显示刷新fab（true：刷新，false：回到顶部）
  bool _isRefreshFabShown = true;

  @override
  void initState() {
    super.initState();
    _initDataAndView();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  void _initDataAndView() {
    _isFirstRequest = true;
    _controller.addListener((){
      var maxScroll = _controller.position.maxScrollExtent; // 可滑动的最大距离
      var pixels = _controller.position.pixels;             // 当前滑动的距离
      var position = _controller.offset;
      debugPrint("当前滚动位置--> $position");
      if(position > 360 && _isRefreshFabShown) {
        // 变为回到顶部按钮
        _isRefreshFabShown = false;
        setState(() {});
      }else if(position <= 360 && position >= 0){
        // 变为刷新数据按钮
        _isRefreshFabShown = true;
        setState(() {});
      }
    });
//    WidgetsBinding.instance.addPostFrameCallback((_) {
//      _refreshKey.currentState.show();
//    });
    _buildProgressView();
    _getTopPlayerInfo();
  }

  /// 获取排行榜玩家的数据
  /// get top players' data of rank.
  Future<void> _getTopPlayerInfo () async{
    List<TopPlayer> list = [];
    repository.getTopRankPlayers().then((data) {
      list = data;
      setState(() {
        topPlayerList = list;
        debugPrint("玩家数据为：${this.topPlayerList.toString()}");
        _isFirstRequest = false;
      });
    });
  }

  /// 排行榜数据刷新
  Future<Null> _refreshData() async {
    topPlayerList.clear();
    return repository.getTopRankPlayers().then((refreshData){
      topPlayerList = refreshData;
      setState(() {
        debugPrint("刷新的玩家数据为：${this.topPlayerList.toString()}");
      });
    });

  }

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: AppBar(title:Text("顶级玩家排行榜")),
      body: new Stack(
        children: <Widget>[
          new RefreshIndicator(
            //key: _refreshKey,
            child: new ListView.builder(
              controller: _controller,
              itemCount: topPlayerList.length,
              itemBuilder: (BuildContext context, int index){
//              if(index < topPlayerList.length){
//                return _buildCard(topPlayerList[index], index);
//              }else {
//                return new Container(
//                  height: 60.0,
//                  margin: EdgeInsets.all(12.0),
//                  color: Colors.white,
//                  child: new Center(
//                    child: new Text("已经给不了主人更多了呢≧︿≦"),
//                  ),
//                );
//              }
                return _buildCard(topPlayerList[index], index);
              },
            ),

            onRefresh: () => _refreshData(),
          ),

          _buildProgressView()
        ],
      ),
      floatingActionButton: _buildFloatActionButton(),
    );
  }

  Widget _buildCard(TopPlayer playerInfo, int position) =>
      new Card(
        color: Colors.white,
        child: new ListTile(
          leading: new CachedNetworkImage(
              width: 32,
              height: 38,
              imageUrl: (playerInfo.clan == null ||
                  playerInfo.clan.badge == null )
                  ? Constant.NO_CLAN_HOLDER_WHITE
                  : playerInfo.clan.badge.image,
              fit: BoxFit.fill,
              placeholder: (context, url) => new CircularProgressIndicator(),
              errorWidget: (context, url, exception) {
                debugPrint("图片加载失败--> $exception");
                return new Image.asset(
                    "assets/images/NoClan.png"
                );
              }
          ),
          title: new Text(
            playerInfo.name,
            style: new TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold
            ),
          ),
          subtitle: new Text(
            playerInfo.clan == null ? "尚未加入部落" : playerInfo.clan.name,
            style: TextStyle(
                fontSize: 12,
                color: Colors.black54
            ),
          ),
          trailing: new Wrap(
            alignment: WrapAlignment.center,
            spacing: 8.0,
            children: <Widget>[
              new Column(
                children: <Widget>[
                  new Text(
                    playerInfo.trophies.toString() + " 奖杯",
                    style: TextStyle(
                        color: Colors.deepPurple,
                        fontSize: 13
                    ),
                  ),
                  new Padding(
                    padding: EdgeInsets.only(top: 6.0),
                    child: new Text(
                      playerInfo.arena.arena,
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.black54
                      ),
                    ),
                  ),

                ],
              ),
              new CachedNetworkImage(
                  width: 38,
                  height: 38,
                  imageUrl: Constant.IMAGE_ASSET_BASE_URL + Constant.IMAGE_ASSET_ARENAS + playerInfo.arena.arenaID.toString() + ".png",
                  fit: BoxFit.fill,
                  placeholder: (context, url) => new CircularProgressIndicator(),
                  errorWidget: (context, url, exception) {
                    debugPrint("图片加载失败--> $exception");
                    return new Image.asset(
                        "assets/images/NoClan.png"
                    );
                  }
              ),
            ],
          ),
          onTap: () {
            final snackBar = new SnackBar(content: new Text("Tap : $position"));
            Scaffold.of(context).showSnackBar(snackBar);
          },
        ),
      );


  /// 加载提示部件
  Widget _buildProgressView() =>
      new Padding(
        padding: const EdgeInsets.all(20.0),
        child: new Center(
          child: new Offstage(
            offstage: !_isFirstRequest ,
            child: new CircularProgressIndicator(),
          ),
        ),
      );

  Widget _buildFloatActionButton() =>
      new FloatingActionButton(
          tooltip: _isRefreshFabShown ? "刷新" : "回到顶部",
          backgroundColor: Theme.of(context).primaryColor,
          child: Icon(_isRefreshFabShown ? Icons.refresh : Icons.keyboard_arrow_up),
          onPressed: () {
            if(_isRefreshFabShown){
              debugPrint("点击刷新状态");

            }else {
              debugPrint("点击回到顶部状态");
              _controller.animateTo(0.0, duration: new Duration(milliseconds: 300), curve: Curves.ease);
              setState(() {_isRefreshFabShown = true;});
            }
          }
      );

}