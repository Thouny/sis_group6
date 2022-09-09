import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sis_group6/presentation/models/sentiment_chart/sentiment_chart_data.dart';
import 'package:sis_group6/presentation/widgets/sentiment_chart.dart';

import '../../fixtures/sentiment_chart_data.dart';

void main() {
  const tData = SentimentChartDataFixture.mockData;
  testWidgets('SentimentChart', (WidgetTester tester) async {
    // arrange
    const keyPrefix = SentimentChart.keyPrefix;
    await tester.pumpWidget(const _WidgetWrapper(data: tData));
    await tester.pumpAndSettle();
    // act
    final chart = find.byKey(const Key(keyPrefix));
    // assert
    expect(chart, findsOneWidget);
  });
}

class _WidgetWrapper extends StatelessWidget {
  const _WidgetWrapper({Key? key, required this.data}) : super(key: key);

  final List<SentimentChartData> data;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            SentimentChart(data: data),
          ],
        ),
      ),
    );
  }
}
