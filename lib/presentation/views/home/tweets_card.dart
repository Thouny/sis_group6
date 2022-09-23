import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sis_group6/bloc/tweets/tweets_bloc.dart';
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
            "Tweets",
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
      child: BlocBuilder<TweetsBloc, TweetsState>(
        builder: (context, state) {
          if (state is LoadedTweetsState) {
            return TweetListCard(tweets: state.tweets);
          } else if (state is LoadingTweetsState) {
            const CircularProgressIndicator();
          } else if (state is FailedTweetsState) {
            return Text(state.message);
          }
          return const SizedBox.expand(
            child: Center(child: Text('SEARCH A TOPIC')),
          );
        },
      ),
    );
  }
}
