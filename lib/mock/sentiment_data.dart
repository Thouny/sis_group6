import 'package:flutter/material.dart';
import 'package:sis_group6/presentation/models/sentiment_chart_data.dart';

final mockData = [
  const SentimentChartData('Positive', 0.7, label: '70%', color: Colors.green),
  const SentimentChartData('Neutral', 0.2, label: '20%', color: Colors.orange),
  const SentimentChartData('Negative', 0.1, label: '10%', color: Colors.red),
];
