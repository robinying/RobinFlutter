class TopPlayerList {
  List<TopPlayer> topPlayers;

  TopPlayerList.fromJson(List<dynamic> mapList)
      : topPlayers =
            mapList.map<TopPlayer>((map) => TopPlayer.fromJson(map)).toList();

  @override
  String toString() {
    return 'TopPlayerList{topPlayers: $topPlayers}';
  }
}

/// 排行榜玩家的简要信息，详细信息见[PlayerDetail]
class TopPlayer {
  String name;
  String tag;
  int rank;
  int previousRank;
  int expLevel;
  int trophies;
  int donationsDelta;
  TeamClan clan;
  Arena arena;

  TopPlayer.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        tag = json['tag'],
        rank = json['rank'],
        previousRank = json['previousRank'],
        expLevel = json['expLevel'],
        trophies = json['trophies'],
        donationsDelta = json['donationsDelta'],
        clan = json['clan'] == null ? null : TeamClan.fromJson(json['clan']),
        // 注意如果玩家没有加入部落，那么此处为空
        arena = Arena.fromJson(json['arena']);

  Map<String, dynamic> toJson() => {
        "name": name,
        "tag": tag,
        "rank": rank,
        "previousRank": previousRank,
        "expLevel": expLevel,
        "trophies": trophies,
        "donationsDelta": donationsDelta,
        "clan": clan.toJson(),
        "arena": arena.toJson()
      };

  @override
  String toString() {
    return 'TopPlayer{'
        'name: $name, '
        'tag: $tag, '
        'rank: $rank, '
        'previousRank: $previousRank, '
        'expLevel: $expLevel, '
        'trophies: $trophies, '
        'donationsDelta: $donationsDelta, '
        'clan: ${clan.toString()}, '
        'arena: ${arena.toString()}'
        '}';
  }
}

class TeamClan {
  String tag;
  String name;
  Badge badge;

  TeamClan.fromJson(Map<String, dynamic> json)
      : tag = json['tag'],
        name = json['name'],
        badge = json['badge'] == null
            ? null
            : Badge.fromJson(json['badge']); // badge可能为null，防止解析失败

  Map<String, dynamic> toJson() =>
      {"tag": tag, "name": name, "badge": badge.toJson()};

  @override
  String toString() {
    return 'TeamClan{'
        'tag: $tag, '
        'name: $name, '
        'badge: $badge'
        '}';
  }
}

/// 部落徽章信息
class Badge {
  String name;
  String category;
  int id;
  String image;

  Badge.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        category = json['category'],
        id = json['id'],
        image = json['image'];

  Map<String, dynamic> toJson() =>
      {"name": name, "category": category, "id": id, "image": image};

  @override
  String toString() {
    return 'Badge{name: $name, category: $category, id: $id, image: $image}';
  }
}

/// 玩家竞技场简要信息
/*
 "arena": {
            "name": "Ultimate Champion",
            "arena": "League 9",
            "arenaID": 21,
            "trophyLimit": 6400
          }
 */
class Arena {
  String name; // 竞技场名称
  String arena; // 竞技场阶级
  int arenaID;
  int trophyLimit; // 奖杯

  Arena.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        arena = json['arena'],
        arenaID = json['arenaID'],
        trophyLimit = json['trophyLimit'];

  Map<String, dynamic> toJson() => {
        "name": name,
        "arena": arena,
        "arenaID": arenaID,
        "trophyLimit": trophyLimit
      };

  @override
  String toString() {
    return 'Arena{name: $name, arena: $arena, arenaID: $arenaID, trophyLimit: $trophyLimit}';
  }
}
