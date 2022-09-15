import 'package:flutter/widgets.dart';

class ListOfTweetsData {
  const ListOfTweetsData(
    this.xData,
    this.yData, {
    required this.label,
    required this.color,
  });

  final String xData;
  final num yData;
  final String label;
  final Color color;
}
