import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:sis_group6/bloc/preferences/preferences_bloc.dart';
import 'package:sis_group6/bloc/sentiment_over_time/sentiment_over_time_bloc.dart';
import 'package:sis_group6/core/consts/home/dashboard.dart';
import 'package:sis_group6/core/enums/sentiment.dart';
import 'package:sis_group6/core/theme/app.dart';
import 'package:sis_group6/presentation/models/sentiment_at_date_graph_data.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SentimentOverTimeGraph extends StatelessWidget {
  const SentimentOverTimeGraph({Key? key}) : super(key: key);

  static const keyPrefix = 'SentimentOverTimeGraph';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SentimentOverTimeBloc, SentimentOverTimeState>(
      builder: (context, state) {
        if (state is LoadedSentimentOverTimeState) {
          return _SentimentCard(
            evolution: state.evolution,
            children: [
              SizedBox(
                height: 200,
                child: Column(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(
                          AppPaddingValues.smallPadding,
                          AppPaddingValues.smallPadding,
                          AppPaddingValues.smallPadding,
                          0,
                        ),
                        child: SfCartesianChart(
                          tooltipBehavior: TooltipBehavior(enable: true),
                          primaryXAxis: DateTimeAxis(
                            isVisible: true,
                            majorGridLines: const MajorGridLines(width: 0),
                            majorTickLines: const MajorTickLines(width: 0),
                            dateFormat: DateFormat.MMMd(),
                            interval: 1,
                            intervalType: DateTimeIntervalType.days,
                          ),
                          primaryYAxis: NumericAxis(
                              isVisible: true,
                              maximum: 110,
                              minimum: 0,
                              majorTickLines: const MajorTickLines(width: 0),
                              labelFormat: '{value}%'),
                          plotAreaBorderColor: Colors.white,
                          series: <ChartSeries>[
                            SplineSeries<SentimentAtDateGraphData, DateTime>(
                                name: 'Postiive %',
                                dataSource: state.sentimentOverTime,
                                xValueMapper: (data, _) => data.xData,
                                yValueMapper: (data, _) => data.yData,
                                markerSettings: const MarkerSettings(
                                  isVisible: true,
                                  width: 4,
                                  height: 4,
                                  borderWidth: 4,
                                ),
                                emptyPointSettings: EmptyPointSettings(
                                  // Mode of empty point
                                  mode: EmptyPointMode.drop,
                                ),
                                dataLabelSettings: const DataLabelSettings(
                                    // isVisible: true,
                                    )),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        } else if (state is LoadingSentimentOverTimeState) {
          return _SentimentCard(
            evolution: null,
            children: [
              Expanded(
                child: Center(
                  child: BlocBuilder<PreferencesBloc, PreferencesState>(
                    builder: (context, state) {
                      if (state is LoadedPreferencesState) {
                        return SpinKitThreeInOut(
                          color: state.isDarkMode
                              ? Colors.white
                              : AppColors.secondaryColor,
                          size: 35,
                        );
                      } else {
                        return const SizedBox.shrink();
                      }
                    },
                  ),
                ),
              ),
            ],
          );
        } else if (state is FailedSentimentOverTimeState) {
          return _SentimentCard(
            evolution: null,
            children: [
              Expanded(
                child: Center(child: Text(state.message)),
              )
            ],
          );
        } else {
          return _SentimentCard(
            evolution: null,
            children: [
              Expanded(
                child: Center(
                  child: Text(
                    DashboardConsts.emptyCardText,
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          fontStyle: FontStyle.italic,
                        ),
                  ),
                ),
              ),
            ],
          );
        }
      },
    );
  }
}

class _SentimentCard extends StatelessWidget {
  const _SentimentCard({
    Key? key,
    required this.children,
    required this.evolution,
  }) : super(key: key);

  final List<Widget> children;
  final double? evolution;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PreferencesBloc, PreferencesState>(
      builder: (context, state) {
        if (state is LoadedPreferencesState) {
          return Container(
            height: 280,
            padding: const EdgeInsets.all(AppPaddingValues.smallPadding),
            decoration: BoxDecoration(
              color:
                  state.isDarkMode ? AppColors.secondaryColor : Colors.grey[50],
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _CardTitle(
                  evolution: evolution,
                ),
                ...children
              ],
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}

class _CardTitle extends StatelessWidget {
  const _CardTitle({
    Key? key,
    required this.evolution,
  }) : super(key: key);

  final double? evolution;

  Widget _buildEvolution(BuildContext context, double evolution) {
    final style = Theme.of(context).textTheme.headline6;
    if (evolution.isNegative) {
      return Text(
        '$evolution%',
        style: style?.copyWith(color: Sentiment.negative.color),
      );
    } else {
      return Text(
        '+$evolution%',
        style: style?.copyWith(color: Sentiment.positive.color),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          DashboardConsts.sentimentOverTimeGraphTitle,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        if (evolution != null) const SizedBox(width: 20),
        if (evolution != null) _buildEvolution(context, evolution!),
      ],
    );
  }
}
