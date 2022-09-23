import 'package:flutter/material.dart';
import 'package:sis_group6/core/theme/app.dart';

class SentimentInfoCard extends StatelessWidget {
  const SentimentInfoCard({
    Key? key,
    required this.title,
    required this.icon,
    required this.percentage,
    required this.tweetCounts,
  }) : super(key: key);

  final String title;
  final String percentage;
  final Icon icon;
  final int tweetCounts;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: AppPaddingValues.smallPadding),
      padding: const EdgeInsets.all(AppPaddingValues.smallPadding),
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: AppColors.primaryColor.withOpacity(0.15),
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(AppPaddingValues.smallPadding),
        ),
      ),
      child: Row(
        children: [
          SizedBox(
            height: 20,
            width: 20,
            child: icon,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppPaddingValues.smallPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    "$tweetCounts tweets",
                    style: Theme.of(context)
                        .textTheme
                        .caption!
                        .copyWith(color: Colors.white70),
                  ),
                ],
              ),
            ),
          ),
          Text(percentage)
        ],
      ),
    );
  }
}
