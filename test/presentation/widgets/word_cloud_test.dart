import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sis_group6/mock/keyword_data.dart';
import 'package:sis_group6/presentation/models/word_cloud/keyword.dart';
import 'package:sis_group6/presentation/widgets/word_cloud.dart';

void main() {
  const tData = mockKeywords;
  testWidgets('WordCloud', (WidgetTester tester) async {
    // arrange
    const keyPrefix = WordCloud.keyPrefix;
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

  final List<Keyword> data;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            WordCloud(data: data),
          ],
        ),
      ),
    );
  }
}
