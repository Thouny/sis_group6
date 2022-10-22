import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:sis_group6/bloc/sentiment_over_time/sentiment_over_time_bloc.dart';
import 'package:sis_group6/core/consts/home/dashboard.dart';
import 'package:sis_group6/core/theme/app.dart';
import 'package:sis_group6/presentation/models/sentiment_at_date_graph_data.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SentimentOverTimeGraph extends StatelessWidget {
  const SentimentOverTimeGraph({Key? key}) : super(key: key);

  static const keyPrefix = 'SentimentOverTimeGraph';

  @override
  Widget build(BuildContext context) {
    List<double?> sentimentYValues = [];
    String sentimentChange;
    return BlocBuilder<SentimentOverTimeBloc, SentimentOverTimeState>(
      builder: (context, state) {
        if (state is LoadedSentimentOverTimeState) {
          for (var i = 0; i < 7; i++) {
            if (state.sentimentOverTime[i].yData != null) {
              sentimentYValues.add(state.sentimentOverTime[i].yData);
            }
          }
          sentimentChange = getSentimentChange(sentimentYValues);
          return _SentimentCard(
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
                                  isVisible: true,
                                )),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: AppPaddingValues.mediumVerticalPadding),
                      child: Text('$sentimentChange% change over time'),
                    ),
                  ],
                ),
              ),
            ],
          );
        } else if (state is LoadingSentimentOverTimeState) {
          return const _SentimentCard(children: [
            Expanded(
              child: Center(
                child: SpinKitThreeInOut(color: Colors.white, size: 35),
              ),
            ),
          ]);
        } else if (state is FailedSentimentOverTimeState) {
          return _SentimentCard(children: [
            Expanded(
              child: Center(child: Text(state.message)),
            )
          ]);
        } else {
          return const _SentimentCard(
            children: [
              Expanded(
                child: Center(
                  child: Text(
                    DashboardConsts.emptyCardText,
                    style: TextStyle(
                      color: Colors.white70,
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
  const _SentimentCard({Key? key, required this.children}) : super(key: key);

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      padding: const EdgeInsets.all(AppPaddingValues.smallPadding),
      decoration: const BoxDecoration(
        color: AppColors.secondaryColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [const _CardTitle(), ...children],
      ),
    );
  }
}

class _CardTitle extends StatelessWidget {
  const _CardTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      DashboardConsts.sentimentOverTimeGraphTitle,
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
    );
  }
}

String getSentimentChange(List sentimentYValues) {
  String sentimentChangeString;
  double sentimentChange =
      sentimentYValues[0] - sentimentYValues[sentimentYValues.length - 1];
  sentimentChangeString = sentimentChange.toStringAsFixed(0);
  return sentimentChangeString;
}
