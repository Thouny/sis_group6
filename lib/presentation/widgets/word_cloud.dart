import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_scatter/flutter_scatter.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sis_group6/bloc/sentiment_details/sentiment_details_bloc.dart';
import 'package:sis_group6/core/consts/home/dashboard.dart';
import 'package:sis_group6/core/theme/app.dart';
import 'package:sis_group6/presentation/models/keyword.dart';

class WordCloud extends StatelessWidget {
  const WordCloud({Key? key}) : super(key: key);

  static const keyPrefix = 'WordCloud';

  List<Widget> _generateScatterItems(List<KeywordModel> keywords) {
    List<Widget> widgets = <Widget>[];
    for (var i = 0; i < keywords.length; i++) {
      widgets.add(_ScatterItem(keywords[i], i));
    }
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final ratio = screenSize.width / screenSize.height;

    return Container(
      decoration: const BoxDecoration(
        color: AppColors.secondaryColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      height: AppHeightValues.tweetsCardHeight,
      child: Padding(
        padding: const EdgeInsets.all(AppPaddingValues.xSmallHorizontalPadding),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(AppPaddingValues.smallPadding),
            child: FittedBox(
              child: BlocBuilder<SentimentDetailsBloc, SentimentDetailsState>(
                builder: (context, state) {
                  if (state is LoadingSentimentDetailsState) {
                    return const SpinKitThreeInOut(
                      color: Colors.white,
                      size: 35,
                    );
                  } else if (state is LoadedSentimentDetailsState) {
                    return Scatter(
                      key: const Key(keyPrefix),
                      fillGaps: true,
                      delegate: ArchimedeanSpiralScatterDelegate(ratio: ratio),
                      children: _generateScatterItems(state.keywords),
                    );
                  } else {
                    return const Text(
                      DashboardConsts.emptyCardText,
                      style: TextStyle(
                        color: Colors.white70,
                        fontStyle: FontStyle.italic,
                      ),
                    );
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ScatterItem extends StatelessWidget {
  const _ScatterItem(this.keyword, this.index, {Key? key}) : super(key: key);

  final KeywordModel keyword;
  final int index;

  @override
  Widget build(BuildContext context) {
    final TextStyle style = Theme.of(context).textTheme.bodyText1!.copyWith(
          fontSize: keyword.size.toDouble(),
          color: keyword.color,
        );
    return RotatedBox(
      quarterTurns: keyword.isRotated ? 1 : 0,
      child: Text(keyword.text, style: style),
    );
  }
}
