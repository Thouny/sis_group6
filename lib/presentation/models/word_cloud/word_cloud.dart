import 'package:flutter/painting.dart';
import 'dart:ui';

import 'package:sis_group6/core/theme/keyword.dart';

class Keyword {
  const Keyword(
    this.text,
    this.color,
    this.size,
    this.rotated,
  );
  final String text;
  final Color color;
  final int size;
  final bool rotated;
}

const List<Keyword> kFlutterHashtags = <Keyword>[
  Keyword('#FlutterLive', KeywordColors.yellow, 100, false),
  Keyword('#FlutterSpiration', KeywordColors.gray600, 24, false),
  Keyword('#FlutterSpirit', KeywordColors.blue600, 12, true),
  Keyword('#FlutterHashtagging', KeywordColors.gray, 14, false),
  Keyword('#FlutterHashtagChallenge', KeywordColors.blue400, 16, false),
  Keyword('#FlutterHashtagOfTheDay', KeywordColors.blue600, 12, true),
  Keyword('#FlutterCover', KeywordColors.gray600, 20, true),
  Keyword('#FlutterDream', KeywordColors.blue, 36, false),
  Keyword('#FlutterAddict', KeywordColors.blue400, 40, false),
  Keyword('#FlutterDevOps', KeywordColors.gray, 32, true),
  Keyword('#Fluttermidable', KeywordColors.gray, 12, false),
  Keyword('#FlutterPackage', KeywordColors.gray600, 14, false),
  Keyword('#FlutterUpgradeDay', KeywordColors.blue600, 16, false),
  Keyword('#FlutterFunCoding', KeywordColors.blue600, 20, true),
  Keyword('#FlutterGuestStars', KeywordColors.blue, 22, false),
  Keyword('#FlutterMagician', KeywordColors.gray, 30, false),
  Keyword('#FlutterHotReload', KeywordColors.yellow, 44, false),
  Keyword('#FlutterMagicTrick', KeywordColors.blue400, 30, true),
  Keyword('#FlutterWeekEnd', KeywordColors.gray, 12, true),
  Keyword('#FlutterArtist', KeywordColors.blue600, 20, false),
  Keyword('#FlutterDevelopers', KeywordColors.gray600, 32, false),
  Keyword('#FlutterGuestStar', KeywordColors.blue600, 34, false),
  Keyword('#FlutterBestDayOfTheWeek', KeywordColors.gray, 12, true),
  Keyword('#FlutterIsMyBFF', KeywordColors.gray, 20, false),
  Keyword('#FlutterIsComing', KeywordColors.yellow, 44, false),
  Keyword('#FlutterMakers', KeywordColors.blue, 32, true),
  Keyword('#FlutterLiveInvite', KeywordColors.blue, 40, false),
  Keyword('#FlutterPower', KeywordColors.blue400, 32, false),
  Keyword('#FlutterCat', KeywordColors.blue, 20, true),
  Keyword('#FlutterExcellent', KeywordColors.gray, 24, true),
  Keyword('#FlutterIsAwesome', KeywordColors.blue, 26, false),
  Keyword('#FlutterExcited', KeywordColors.blue600, 28, false),
  Keyword('#FlutterReady', KeywordColors.gray, 36, true),
  Keyword('#FlutterRennes', KeywordColors.blue, 36, false),
  Keyword('#FlutterLiveRegistration', KeywordColors.blue400, 40, false),
  Keyword('#FlutterLiveTicket', KeywordColors.blue, 36, false),
  Keyword('#FlutterDreamComeTrue', KeywordColors.blue400, 20, false),
  Keyword('#SeeYouLiveAtFlutterLive', KeywordColors.blue, 12, false),
  Keyword('#GoodFlutterNews', KeywordColors.blue, 14, false),
  Keyword('#FlutterIsSoGreat', KeywordColors.blue, 20, false),
  Keyword('#FlutterUsers', KeywordColors.blue, 30, false),
  Keyword('#FlutterSpeakers', KeywordColors.blue, 22, true),
  Keyword('#FlutterSwag', KeywordColors.blue, 34, false),
  Keyword('#Flutter40K', KeywordColors.yellow, 50, false),
];
