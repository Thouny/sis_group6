import 'package:flutter/material.dart';
import 'package:sis_group6/core/theme/app.dart';
import 'package:sis_group6/domain/entities/tweet.dart';

class TweetListCard extends StatelessWidget {
  const TweetListCard({super.key, required this.tweets});

  final List<TweetEntity> tweets;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppPaddingValues.xSmallHorizontalPadding),
      height: AppHeightValues.sentimentChartHeight,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(AppPaddingValues.smallPadding),
          child: ListView.separated(
            shrinkWrap: true,
            itemCount: tweets.length,
            itemBuilder: (context, index) {
              final currentTweet = tweets[index];
              return ListTile(
                title: Text(currentTweet.text),
                subtitle: Text(
                  currentTweet.publicMetrics?.likeCount.toString() ?? '',
                ),
              );
            },
            separatorBuilder: (context, indext) => const Divider(),
          ),
        ),
      ),
    );
  }
}
