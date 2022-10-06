import 'package:sis_group6/domain/entities/tweet.dart';
import 'package:sis_group6/domain/entities/keyword.dart';

class GetSentimentResponse {
  const GetSentimentResponse({
    required this.sentimentStat,
    required this.tweets,
    required this.wordClouds,
  });

  final double sentimentStat;
  final List<TweetEntity> tweets;
  final List<KeywordEntity> wordClouds;

  factory GetSentimentResponse.fromJson(Map<String, dynamic> data) {
    return GetSentimentResponse(
      sentimentStat: data['sentimentStat'],
      tweets: _mapToTweets(List<Map<String, dynamic>>.from(data['tweets'])),
      wordClouds: _mapToKeywords(List<List<dynamic>>.from(data['word_cloud'])),
    );
  }

  static List<TweetEntity> _mapToTweets(List<Map<String, dynamic>> data) {
    final tweets = <TweetEntity>[];
    for (final element in data) {
      tweets.add(TweetEntity.fromMap(element));
    }
    return tweets;
  }

  static List<KeywordEntity> _mapToKeywords(List<List<dynamic>> data) {
    final keywords = <KeywordEntity>[];
    for (final element in data) {
      keywords.add(KeywordEntity.fromJson(element));
    }
    return keywords;
  }
}
