import 'dart:math';

import 'package:flutter/material.dart';

class KeywordColors {
  static const Color yellow = Color(0xFFFFC108);
  static const Color blue400 = Color(0xFF13B9FD);
  static const Color blue600 = Color(0xFF0175C2);
  static const Color blue = Color(0xFF02569B);
  static const Color gray600 = Color(0xFF60646B);

  static const List<Color> colors = [yellow, blue400, blue600, blue, gray600];

  static Color get random {
    return colors[Random().nextInt(colors.length)];
  }
}
