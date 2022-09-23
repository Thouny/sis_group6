import 'package:flutter/material.dart';
import 'package:flutter_scatter/flutter_scatter.dart';
import 'package:sis_group6/core/theme/app.dart';
import 'package:sis_group6/presentation/models/word_cloud/word_cloud.dart';

class WordCloud extends StatelessWidget {
  const WordCloud({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = <Widget>[];
    for (var i = 0; i < kFlutterHashtags.length; i++) {
      widgets.add(ScatterItem(kFlutterHashtags[i], i));
    }

    final screenSize = MediaQuery.of(context).size;
    final ratio = screenSize.width / screenSize.height;

    return SizedBox(
      height: AppHeightValues.sentimentChartHeight,
      child: Padding(
        padding: const EdgeInsets.all(AppPaddingValues.xSmallHorizontalPadding),
        child: Card(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(AppPaddingValues.smallPadding),
              child: FittedBox(
                child: Scatter(
                  fillGaps: true,
                  delegate: ArchimedeanSpiralScatterDelegate(ratio: ratio),
                  children: widgets,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ScatterItem extends StatelessWidget {
  const ScatterItem(this.keyword, this.index, {Key? key}) : super(key: key);
  final Keyword keyword;
  final int index;

  @override
  Widget build(BuildContext context) {
    final TextStyle style = Theme.of(context).textTheme.bodyText1!.copyWith(
          fontSize: keyword.size.toDouble(),
          color: keyword.color,
        );
    return RotatedBox(
      quarterTurns: keyword.rotated ? 1 : 0,
      child: Text(
        keyword.text,
        style: style,
      ),
    );
  }
}
