import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sis_group6/bloc/sentiment_details/sentiment_details_bloc.dart';
import 'package:sis_group6/bloc/tweets/tweets_bloc.dart';
import 'package:sis_group6/core/consts/home/dashboard.dart';
import 'package:sis_group6/core/theme/app.dart';
import 'package:sis_group6/presentation/widgets/tweet_list_card.dart';

class TweetsCard extends StatelessWidget {
  const TweetsCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppPaddingValues.smallPadding),
      decoration: const BoxDecoration(
        color: AppColors.secondaryColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            DashboardConsts.tweetsCardTitle,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          const SizedBox(
            width: double.infinity,
            child: _TweetContent(),
          ),
        ],
      ),
    );
  }
}

class _TweetContent extends StatelessWidget {
  const _TweetContent();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppHeightValues.tweetsCardHeight,
      child: BlocBuilder<SentimentDetailsBloc, SentimentDetailsState>(
        builder: (context, state) {
          if (state is LoadedSentimentDetailsState) {
            return TweetListCard(tweets: state.tweets);
          } else if (state is LoadingSentimentDetailsState) {
            return const Expanded(
              child: Center(
                child: SpinKitThreeInOut(color: Colors.white, size: 35),
              ),
            );
          } else if (state is FailedSentimentDetailsState) {
            return Text(state.message);
          }
          return const SizedBox.expand(
            child: Center(
              child: Text(
                DashboardConsts.emptyCardText,
                style: TextStyle(
                  color: Colors.white70,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
