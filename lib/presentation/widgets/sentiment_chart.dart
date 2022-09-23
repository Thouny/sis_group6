import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:sis_group6/core/theme/app.dart';
import 'package:sis_group6/presentation/models/sentiment_chart/sentiment_chart_data.dart';

class SentimentChart extends StatelessWidget {
  const SentimentChart({Key? key, required this.data}) : super(key: key);

  final List<SentimentChartData> data;

  static const keyPrefix = 'SentimentChart';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppHeightValues.sentimentChartHeight,
      child: Stack(
        children: [
          PieChart(
            PieChartData(
              sectionsSpace: 0,
              centerSpaceRadius: 70,
              startDegreeOffset: -90,
              sections: paiChartSelectionDatas,
            ),
          ),
          Positioned.fill(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: AppPaddingValues.smallPadding),
                Text(
                  "70%",
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        height: 0.5,
                      ),
                ),
                const Text("of positive level"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

List<PieChartSectionData> paiChartSelectionDatas = [
  PieChartSectionData(
    color: const Color.fromARGB(255, 38, 255, 89),
    value: 70,
    showTitle: false,
    // radius: 22,
  ),
  PieChartSectionData(
    color: const Color(0xFFEE2727),
    value: 30,
    showTitle: false,
    // radius: 16,
  ),
];
