import 'package:flutter/painting.dart';
import 'dart:ui';

class Keyword {
  const Keyword(
    this.text,
    this.color,
    this.size,
    this.isRotated,
  );

  final String text;
  final Color color;
  final int size;
  final bool isRotated;
}
