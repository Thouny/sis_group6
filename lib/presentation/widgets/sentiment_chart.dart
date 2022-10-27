import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sis_group6/bloc/preferences/preferences_bloc.dart';
import 'package:sis_group6/core/theme/app.dart';
import 'package:sis_group6/presentation/models/sentiment_chart_data.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SentimentChart extends StatelessWidget {
  const SentimentChart({
    Key? key,
    required this.data,
    required this.positiveSentiment,
  }) : super(key: key);

  final List<SentimentChartData> data;
  final int positiveSentiment;

  static const keyPrefix = 'SentimentChart';

  @override
  Widget build(BuildContext context) {
    final headlineStyle = Theme.of(context).textTheme.headline4;
    return SizedBox(
      height: AppHeightValues.sentimentChartHeight,
      child: Stack(
        children: [
          Expanded(
            child: SfCircularChart(
              margin: EdgeInsets.zero,
              key: const Key(keyPrefix),
              series: <DoughnutSeries<SentimentChartData, String>>[
                DoughnutSeries<SentimentChartData, String>(
                  innerRadius: '65%',
                  explode: false,
                  explodeIndex: 0,
                  pointColorMapper: (SentimentChartData data, _) => data.color,
                  dataSource: data,
                  xValueMapper: (SentimentChartData data, _) => data.xData,
                  yValueMapper: (SentimentChartData data, _) => data.yData,
                  dataLabelSettings: const DataLabelSettings(isVisible: false),
                ),
              ],
            ),
          ),
          Positioned.fill(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: AppPaddingValues.smallPadding),
                BlocBuilder<PreferencesBloc, PreferencesState>(
                  builder: (context, state) {
                    if (state is LoadedPreferencesState) {
                      return Text(
                        '$positiveSentiment%',
                        style: headlineStyle?.copyWith(
                          color: state.isDarkMode
                              ? Colors.white
                              : Colors.grey[800],
                          fontWeight: FontWeight.w600,
                          height: 0.5,
                        ),
                      );
                    } else {
                      return const SizedBox.shrink();
                    }
                  },
                ),
                const Text('of positive level'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
