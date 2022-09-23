import 'package:flutter/painting.dart';
import 'dart:ui';

class Keyword {
  const Keyword(
    this.hashtag,
    this.color,
    this.size,
    this.rotated,
  );
  final String hashtag;
  final Color color;
  final int size;
  final bool rotated;
}

class FlutterColors {
  const FlutterColors._();

  static const Color yellow = Color(0xFFFFC108);

  static const Color white = Color(0xFFFFFFFF);

  static const Color blue400 = Color(0xFF13B9FD);
  static const Color blue600 = Color(0xFF0175C2);
  static const Color blue = Color(0xFF02569B);

  static const Color gray100 = Color(0xFFD5D7DA);
  static const Color gray600 = Color(0xFF60646B);
  static const Color gray = Color(0xFF202124);
}

const List<Keyword> kFlutterHashtags = <Keyword>[
  Keyword('#FlutterLive', FlutterColors.yellow, 100, false),
  Keyword('#FlutterSpiration', FlutterColors.gray600, 24, false),
  Keyword('#FlutterSpirit', FlutterColors.blue600, 12, true),
  Keyword('#FlutterHashtagging', FlutterColors.gray, 14, false),
  Keyword('#FlutterHashtagChallenge', FlutterColors.blue400, 16, false),
  Keyword('#FlutterHashtagOfTheDay', FlutterColors.blue600, 12, true),
  Keyword('#FlutterCover', FlutterColors.gray600, 20, true),
  Keyword('#FlutterDream', FlutterColors.blue, 36, false),
  Keyword('#FlutterAddict', FlutterColors.blue400, 40, false),
  Keyword('#FlutterDevOps', FlutterColors.gray, 32, true),
  Keyword('#Fluttermidable', FlutterColors.gray, 12, false),
  Keyword('#FlutterPackage', FlutterColors.gray600, 14, false),
  Keyword('#FlutterUpgradeDay', FlutterColors.blue600, 16, false),
  Keyword('#FlutterFunCoding', FlutterColors.blue600, 20, true),
  Keyword('#FlutterGuestStars', FlutterColors.blue, 22, false),
  Keyword('#FlutterMagician', FlutterColors.gray, 30, false),
  Keyword('#FlutterHotReload', FlutterColors.yellow, 44, false),
  Keyword('#FlutterMagicTrick', FlutterColors.blue400, 30, true),
  Keyword('#FlutterWeekEnd', FlutterColors.gray, 12, true),
  Keyword('#FlutterArtist', FlutterColors.blue600, 20, false),
  Keyword('#FlutterDevelopers', FlutterColors.gray600, 32, false),
  Keyword('#FlutterGuestStar', FlutterColors.blue600, 34, false),
  Keyword('#FlutterBestDayOfTheWeek', FlutterColors.gray, 12, true),
  Keyword('#FlutterIsMyBFF', FlutterColors.gray, 20, false),
  Keyword('#FlutterIsComing', FlutterColors.yellow, 44, false),
  Keyword('#FlutterMakers', FlutterColors.blue, 32, true),
  Keyword('#FlutterLiveInvite', FlutterColors.blue, 40, false),
  Keyword('#FlutterPower', FlutterColors.blue400, 32, false),
  Keyword('#FlutterCat', FlutterColors.blue, 20, true),
  Keyword('#FlutterExcellent', FlutterColors.gray, 24, true),
  Keyword('#FlutterIsAwesome', FlutterColors.blue, 26, false),
  Keyword('#FlutterExcited', FlutterColors.blue600, 28, false),
  Keyword('#FlutterReady', FlutterColors.gray, 36, true),
  Keyword('#FlutterRennes', FlutterColors.blue, 36, false),
  Keyword('#FlutterLiveRegistration', FlutterColors.blue400, 40, false),
  Keyword('#FlutterLiveTicket', FlutterColors.blue, 36, false),
  Keyword('#FlutterDreamComeTrue', FlutterColors.blue400, 20, false),
  Keyword('#SeeYouLiveAtFlutterLive', FlutterColors.blue, 12, false),
  Keyword('#GoodFlutterNews', FlutterColors.blue, 14, false),
  Keyword('#FlutterIsSoGreat', FlutterColors.blue, 20, false),
  Keyword('#FlutterUsers', FlutterColors.blue, 30, false),
  Keyword('#FlutterSpeakers', FlutterColors.blue, 22, true),
  Keyword('#FlutterSwag', FlutterColors.blue, 34, false),
  Keyword('#Flutter40K', FlutterColors.yellow, 50, false),
];
