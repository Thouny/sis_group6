import 'package:sis_group6/domain/entities/keyword.dart';
import 'package:sis_group6/domain/entities/mention.dart';

abstract class BaseSentimentResponse {
  const BaseSentimentResponse({
    required this.sentimentStat,
    required this.mentions,
    required this.wordClouds,
  });

  final double sentimentStat;
  final List<MentionEntity> mentions;
  final List<KeywordEntity> wordClouds;
}
