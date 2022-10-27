import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sis_group6/bloc/preferences/preferences_bloc.dart';
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
                mentionsCount: state.positiveCount,
                icon: Icon(
                  Icons.thumb_up,
                  color: Sentiment.positive.color,
                ),
              ),
              SentimentInfoCard(
                title: Sentiment.negative.label,
                percentage: "${state.negativeSentiment}%",
                mentionsCount: state.negativeCount,
                icon: Icon(Icons.thumb_down, color: Sentiment.negative.color),
              ),
            ],
          );
        } else if (state is LoadingSentimentDetailsState) {
          return _SentimentCard(
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
        } else if (state is FailedSentimentDetailsState) {
          return _SentimentCard(
            children: [
              Expanded(child: Center(child: Text(state.message))),
            ],
          );
        } else {
          return _SentimentCard(
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
  const _SentimentCard({Key? key, required this.children}) : super(key: key);

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PreferencesBloc, PreferencesState>(
      builder: (context, state) {
        if (state is LoadedPreferencesState) {
          return Container(
            height: 500,
            padding: const EdgeInsets.all(AppPaddingValues.smallPadding),
            decoration: BoxDecoration(
              color:
                  state.isDarkMode ? AppColors.secondaryColor : Colors.grey[50],
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [const _CardTitle(), ...children],
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
  const _CardTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      DashboardConsts.sentimentChartTitle,
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
    );
  }
}
