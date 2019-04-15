import 'package:robin_app/common/constant.dart';

/// 皇室战争API接口汇总
/// @author moosphon
class RoyaleApi{
  /// 查看玩家详细信息 eg: < https://royaleapi.com/player/8L9L9GL >
  static const String PLAYER_INFO = Constant.ROYALE_API_ROOT + "player/";

  /// 查看玩家战斗记录 eg: < https://api.royaleapi.com/player/<TAG>/battles >
  static const String BATTLE_INFO = Constant.ROYALE_API_ROOT + "/battles";

  /// 查看玩家未来宝箱 eg: < https://api.royaleapi.com/player/<TAG>/chests >
  static const String CHESTS_INFO = Constant.ROYALE_API_ROOT + "/chests";

  /// 查找符合条件部落 eg: < https://api.royaleapi.com/clan/search?name=<NAME>&score=<SCORE>&minMembers=<MIN_MEMBERS>&maxMembers=<MAX_MEMBERS>&locationId=<LOCATION_ID> >
  static const String SEARCH_CLAN = Constant.ROYALE_API_ROOT + "clan/search";

  /// 查看目标部落详情 eg: < https://api.royaleapi.com/clan/<TAG> >
  static const String CLAN_DETAIL = Constant.ROYALE_API_ROOT + "clan/";

  /// 查看部落玩家战斗记录 eg: < https://api.royaleapi.com/clan/<TAG>/battles >
  static const String CLAN_BATTLE = Constant.ROYALE_API_ROOT + "/battles";

  /// 查看部落当前战争记录 eg: < https://api.royaleapi.com/clan/<TAG>/war >
  static const String CLAN_WAR_NOW = Constant.ROYALE_API_ROOT + "/war";

  /// 查看部落过去战争记录 eg: < https://api.royaleapi.com/clan/<TAG>/warlog >
  static const String CLAN_WAR_LOG = Constant.ROYALE_API_ROOT + "/warlog";

  /// 查看部落成员统计信息(默认为七天) eg: < https://api.royaleapi.com/clan/<TAG>/history >
  static const String CLAN_MEMBER_INFO = Constant.ROYALE_API_ROOT + "/history";

  /// 查看部落成员一周数据 eg: < https://api.royaleapi.com/clan/<TAG>/history/weekly >
  static const String CLAN_INFO_WEEKLY = Constant.ROYALE_API_ROOT + "/history/weekly";

  /// 查看部落是否包含在部落追踪统计列表中(以上两个history接口取决于该接口) eg: < https://api.royaleapi.com/clan/<TAG>/tracking >
  static const String CLAN_TRACKED = Constant.ROYALE_API_ROOT + "/tracking";

  /// 查看已开放的锦标赛 eg: < https://api.royaleapi.com/tournaments/open >
  static const String TOURNAMENTS_OPEN = Constant.ROYALE_API_ROOT + "tournaments/open";

  /// 查看已知锦标赛数据 eg: < https://api.royaleapi.com/tournaments/known >
  static const String TOURNAMENTS_KNOW = Constant.ROYALE_API_ROOT + "tournaments/known";

  /// 查看最多1000玩家的锦标赛 eg: < https://api.royaleapi.com/tournaments/1k >
  static const String TOURNAMENTS_THOUSAND_MAX = Constant.ROYALE_API_ROOT + "tournaments/1k";

  /// 查看正在准备的锦标赛 eg: < https://api.royaleapi.com/tournaments/inprep >
  static const String TOURNAMENTS_PREPARE = Constant.ROYALE_API_ROOT + "tournaments/inprep";

  /// 查看已满员的锦标赛 eg: < https://api.royaleapi.com/tournaments/full >
  static const String TOURNAMENTS_FULL = Constant.ROYALE_API_ROOT + "tournaments/full";

  /// 查看可加入的锦标赛 eg: < https://api.royaleapi.com/tournaments/joinable >
  static const String TOURNAMENTS_JOINABLE = Constant.ROYALE_API_ROOT + "tournaments/joinable";

  /// 搜索锦标赛(根据名字) eg: < https://api.royaleapi.com/tournaments/search?name=<NAME> >
  static const String TOURNAMENT_SEARCH = Constant.ROYALE_API_ROOT + "tournaments/search";

  /// 查找锦标赛(根据TAG) eg: < https://api.royaleapi.com/tournament/20YU0VJ9 >
  static const String TOURNAMENT_INFO = Constant.ROYALE_API_ROOT + "tournament/";

  /// 查看某地区排行榜前200顶级部落 eg: < https://api.royaleapi.com/top/clans/<LOCATION_KEY> >
  static const String CLAN_TOP_200 = Constant.ROYALE_API_ROOT + "top/clans/";

  /// 查看某地区排行榜前200顶级玩家 eg: < https://api.royaleapi.com/top/players/<LOCATION_KEY> >
  static const String PLAYER_TOP_200 = Constant.ROYALE_API_ROOT + "top/players";

  /// 查看某地区部落战争排行榜前200顶级部落 eg: < https://api.royaleapi.com/top/war/<LOCATION_KEY> >
  static const String CLAN_WAR_TOP_200 = Constant.ROYALE_API_ROOT + "top/war/";

  /// 查看最受欢迎的部落(玩家请求频次) eg: < https://api.royaleapi.com/popular/clans >
  static const String POPULAR_CLAN = Constant.ROYALE_API_ROOT + "popular/clans";

  /// 查看热门玩家(玩家查看频次) eg: < https://api.royaleapi.com/popular/players >
  static const String POPULAR_PLAYERS = Constant.ROYALE_API_ROOT + "popular/players";

  /// 查看热门锦标赛 eg: < https://api.royaleapi.com/popular/tournaments >
  static const String POPULAR_TOURNAMENT = Constant.ROYALE_API_ROOT + "opular/tournaments";

  /// 查看最受欢迎的卡组 eg: < https://api.royaleapi.com/popular/decks >
  static const String POPULAR_DECKS = Constant.ROYALE_API_ROOT + "popular/decks";

  /// 查看当前可用的所有接口 eg: < https://api.royaleapi.com/endpoints >
  static const String ENDPOINTS = Constant.ROYALE_API_ROOT + "endpoints";

}