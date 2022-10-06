import 'package:flutter/material.dart';
import 'package:sis_group6/core/enums/sentiment.dart';
import 'package:sis_group6/core/theme/app.dart';
import 'package:sis_group6/domain/entities/tweet.dart';

class TweetListCard extends StatelessWidget {
  const TweetListCard({super.key, required this.tweets});

  final List<TweetEntity> tweets;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppPaddingValues.xSmallHorizontalPadding),
      height: AppHeightValues.tweetsCardHeight,
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: tweets.length,
        itemBuilder: (context, index) {
          final currentTweet = tweets[index];
          return ListTile(
            title: Text(currentTweet.text),
            subtitle: Text(
              currentTweet.sentiment?.label ?? '',
              style: Theme.of(context)
                  .textTheme
                  .caption
                  ?.copyWith(color: currentTweet.sentiment?.color),
            ),
          );
        },
        separatorBuilder: (context, indext) => const Divider(),
      ),
    );
  }
}
