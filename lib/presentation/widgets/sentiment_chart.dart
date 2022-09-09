import 'package:flutter/material.dart';
import 'package:sis_group6/core/consts/home/home.dart';
import 'package:sis_group6/core/theme/app.dart';
import 'package:sis_group6/mock/sentiment_data.dart';
import 'package:sis_group6/presentation/models/sentiment_chart/sentiment_chart_data.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SentimentChart extends StatelessWidget {
  const SentimentChart({Key? key, required this.data}) : super(key: key);

  final List<SentimentChartData> data;

  static const keyPrefix = 'SentimentChart';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppPaddingValues.xSmallHorizontalPadding),
      height: AppHeightValues.sentimentChartHeight,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(AppPaddingValues.smallPadding),
          child: SfCircularChart(
            key: const Key(keyPrefix),
            title: ChartTitle(
              text: HomeConsts.sentimentChartTitle,
              alignment: ChartAlignment.near,
            ),
            legend: Legend(isVisible: true),
            series: <DoughnutSeries<SentimentChartData, String>>[
              DoughnutSeries<SentimentChartData, String>(
                explode: false,
                explodeIndex: 0,
                pointColorMapper: (SentimentChartData data, _) => data.color,
                dataSource: mockData,
                xValueMapper: (SentimentChartData data, _) => data.xData,
                yValueMapper: (SentimentChartData data, _) => data.yData,
                dataLabelMapper: (SentimentChartData data, _) => data.label,
                dataLabelSettings: const DataLabelSettings(isVisible: true),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
