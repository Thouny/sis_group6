import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sis_group6/bloc/sentiment_details/sentiment_details_bloc.dart';
import 'package:sis_group6/core/consts/home/dashboard.dart';
import 'package:sis_group6/core/enums/sentiment.dart';
import 'package:sis_group6/core/theme/app.dart';
import 'package:sis_group6/presentation/models/sentiment_chart_data.dart';
import 'package:sis_group6/presentation/widgets/sentiment_chart.dart';
import 'package:sis_group6/presentation/widgets/sentiment_info_card.dart';

class SentimentDetails extends StatelessWidget {
  const SentimentDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SentimentDetailsBloc, SentimentDetailsState>(
      builder: (context, state) {
        if (state is LoadedSentimentDetailsState) {
          return _SentimentCard(
            children: [
              SentimentChart(
                data: <SentimentChartData>[
                  SentimentChartData(
                    'Positive sentiment',
                    state.positiveSentiment,
                    label: Sentiment.positive.label,
                    color: Sentiment.positive.color,
                  ),
                  SentimentChartData(
                    'Negative sentiment',
                    state.negativeSentiment,
                    label: Sentiment.negative.label,
                    color: Sentiment.negative.color,
                  )
                ],
                positiveSentiment: state.positiveSentiment,
              ),
              SentimentInfoCard(
                title: Sentiment.positive.label,
                percentage: "${state.positiveSentiment}%",
                tweetCounts: state.positiveCount,
                icon: Icon(
                  Icons.thumb_up,
                  color: Sentiment.positive.color,
                ),
              ),
              SentimentInfoCard(
                title: Sentiment.negative.label,
                percentage: "${state.negativeSentiment}%",
                tweetCounts: state.negativeCount,
                icon: Icon(Icons.thumb_down, color: Sentiment.negative.color),
              ),
            ],
          );
        } else if (state is LoadingSentimentDetailsState) {
          return const _SentimentCard(
            children: [
              Expanded(
                child: Center(
                  child: SpinKitThreeInOut(color: Colors.white, size: 35),
                ),
              ),
            ],
          );
        } else if (state is FailedSentimentDetailsState) {
          return _SentimentCard(
            children: [
              Expanded(child: Center(child: Text(state.message))),
            ],
          );
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
      height: 500,
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
      DashboardConsts.sentimentChartTitle,
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
    );
  }
}
