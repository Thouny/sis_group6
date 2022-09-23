import 'package:flutter/material.dart';
import 'package:sis_group6/core/theme/app.dart';
import 'package:sis_group6/mock/sentiment_data.dart';
import 'package:sis_group6/presentation/widgets/sentiment_chart.dart';
import 'package:sis_group6/presentation/widgets/sentiment_info_card.dart';

class SentimentDetails extends StatelessWidget {
  const SentimentDetails({Key? key}) : super(key: key);

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
          const Text(
            "Overall Sentiment",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: AppPaddingValues.smallPadding),
          SentimentChart(data: mockData),
          const SentimentInfoCard(
            title: "Positive",
            percentage: "70%",
            tweetCounts: 132,
            icon: Icon(Icons.thumb_up),
          ),
          const SentimentInfoCard(
            title: "Negative",
            percentage: "30%",
            tweetCounts: 58,
            icon: Icon(Icons.thumb_down),
          ),
        ],
      ),
    );
  }
}
