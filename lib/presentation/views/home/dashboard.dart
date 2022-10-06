import 'package:flutter/material.dart';
import 'package:sis_group6/core/theme/app.dart';
import 'package:sis_group6/core/utils/responsive.dart';
import 'package:sis_group6/presentation/views/home/tweets_card.dart';
import 'package:sis_group6/presentation/widgets/header.dart';
import 'package:sis_group6/presentation/widgets/sentiment_details.dart';
import 'package:sis_group6/presentation/widgets/word_cloud.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({Key? key}) : super(key: key);

  static const keyPrefix = 'DashboardView';

  @override
  Widget build(BuildContext context) {
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
                    if (Responsive.isMobile(context))
                      const SizedBox(height: AppPaddingValues.smallPadding),
                    const TweetsCard(),
                    const SizedBox(height: AppPaddingValues.smallPadding),
                    const WordCloud(
                      data: [],
                    ),
                  ],
                ),
              ),
              if (!Responsive.isMobile(context))
                const SizedBox(width: AppPaddingValues.smallPadding),
              if (!Responsive.isMobile(context))
                const Expanded(flex: 2, child: SentimentDetails()),
            ],
          ),
        ],
      ),
    );
  }
}
