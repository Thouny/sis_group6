import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sis_group6/bloc/tweets/tweets_bloc.dart';
import 'package:sis_group6/core/theme/app.dart';
import 'package:sis_group6/core/utils/responsive.dart';
import 'package:sis_group6/presentation/widgets/header.dart';
import 'package:sis_group6/presentation/widgets/sentiment_details.dart';
import 'package:sis_group6/presentation/widgets/tweet_list_card.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({Key? key}) : super(key: key);

  static const keyPrefix = 'DashboardView';

  @override
  Widget build(BuildContext context) {
    final tweetsBloc = BlocProvider.of<TweetsBloc>(context);
    return SingleChildScrollView(
      primary: false,
      padding: const EdgeInsets.all(AppPaddingValues.smallPadding),
      child: Column(
        children: [
          const Header(),
          const SizedBox(height: AppPaddingValues.smallPadding),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 5,
                child: Column(
                  children: [
                    // TODO: Add more cards here
                    if (Responsive.isMobile(context)) const SentimentDetails(),
                  ],
                ),
              ),
              if (!Responsive.isMobile(context))
                const SizedBox(width: AppPaddingValues.smallPadding),
              if (!Responsive.isMobile(context))
                const Expanded(
                  flex: 2,
                  child: SentimentDetails(),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SearchBar extends StatelessWidget {
  const _SearchBar({Key? key, this.onSubmitted}) : super(key: key);

  final Function(String value)? onSubmitted;

  @override
  Widget build(BuildContext context) {
    return TextField(onSubmitted: onSubmitted);
  }
}

class _TweetContent extends StatelessWidget {
  const _TweetContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppPaddingValues.xSmallHorizontalPadding),
      height: AppHeightValues.sentimentChartHeight,
      child: Card(
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
      ),
    );
  }
}
