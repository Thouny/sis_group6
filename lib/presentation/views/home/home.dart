import 'package:flutter/material.dart';
import 'package:sis_group6/mock/sentiment_data.dart';
import 'package:sis_group6/presentation/widgets/sentiment_chart.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SentimentChart(data: mockData),
        ],
      ),
    );
  }
}
