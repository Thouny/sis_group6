import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sis_group6/bloc/tweets/tweets_bloc.dart';
import 'package:sis_group6/core/theme/app.dart';
import 'package:sis_group6/mock/sentiment_data.dart';
import 'package:sis_group6/presentation/widgets/sentiment_chart.dart';
import 'package:sis_group6/presentation/widgets/tweet_list_card.dart';

import '../../widgets/word_cloud.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  static const keyPrefix = 'HomeView';

  @override
  Widget build(BuildContext context) {
    final tweetsBloc = BlocProvider.of<TweetsBloc>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _SearchBar(
              key: const Key('$keyPrefix-SearchBar'),
              onSubmitted: (value) {
                if (value.isNotEmpty) {
                  tweetsBloc.add(SearchTweetsEvent(value));
                }
              },
            ),
            Column(
              children: [
                SentimentChart(data: mockData),
                const _TweetContent(key: Key('$keyPrefix-TweetsCard')),
                const WordCloud(),
              ],
            ),
          ],
        ),
      ),
    );
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

class _SearchBar extends StatelessWidget {
  const _SearchBar({Key? key, this.onSubmitted}) : super(key: key);

  final Function(String value)? onSubmitted;

  @override
  Widget build(BuildContext context) {
    return TextField(onSubmitted: onSubmitted);
  }
}
