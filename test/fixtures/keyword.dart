import 'package:sis_group6/core/theme/keyword.dart';
import 'package:sis_group6/presentation/models/keyword.dart';

class KeywordFixtures {
  static const List<KeywordModel> mockKeywords = <KeywordModel>[
    KeywordModel(
      text: '#FlutterLive',
      color: KeywordColors.yellow,
      size: 100,
      isRotated: false,
    ),
    KeywordModel(
      text: '#FlutterSpiration',
      color: KeywordColors.gray600,
      size: 24,
      isRotated: false,
    ),
    KeywordModel(
      text: '#FlutterSpirit',
      color: KeywordColors.blue600,
      size: 12,
      isRotated: true,
    ),
  ];
}
