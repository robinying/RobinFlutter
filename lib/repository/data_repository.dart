
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:robin_app/http/net_util.dart';
import 'package:robin_app/http/api.dart';
import 'package:robin_app/model/top_player_list.dart';

class DataRepository {

  /// 获取排行榜前200顶级玩家数据
  /// [locationLimit] 作区域限制筛选
  /// todo:type '_InternalLinkedHashMap<String, dynamic>' is not a subtype of type 'Badge'
  /// todo:FormatException: Unexpected character (at character 3)
  /// todo:NoSuchMethodError: The method '[]' was called on null. Tried calling: []("tag")
  Future<List<TopPlayer>> getTopRankPlayers({String locationLimit}) async {
    String url = locationLimit == null ? RoyaleApi.PLAYER_TOP_200 : RoyaleApi.PLAYER_TOP_200 + "/" + locationLimit;
    List<TopPlayer> topPlayers;
    Response response = await NetUtils.get(url);
    if(response.statusCode == HttpStatus.ok || response.statusCode == HttpStatus.created){
      try {
        print("前200玩家数据-->" + response.data.toString());
        print(response.data.runtimeType);
        TopPlayerList topPlayerList = TopPlayerList.fromJson(response.data);
        topPlayers = topPlayerList.topPlayers;
        print(topPlayers.toString());
        return topPlayers;
      } catch(e){
        print("获取顶级玩家数据出错了-->"+e.toString());
        return new Future.error(new DioError(
            response: response,
            message: "parsing response json error...",
            type: DioErrorType.RESPONSE
        ));
      }
    }
    return new Future.error(new DioError(
      response: response,
      message: "service connected failed, statusCode: ${response.statusCode}",
      type: DioErrorType.RESPONSE,
    ));
  }


}