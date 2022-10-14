import 'package:sis_group6/domain/entities/tweet.dart';
import 'package:sis_group6/domain/entities/keyword.dart';

class GetSentimentAtDateResponse {
  const GetSentimentAtDateResponse({
    required this.sentimentStat,
    required this.tweets,
    required this.wordClouds,
    required this.date,
  });

  final double sentimentStat;
  final List<TweetEntity> tweets;
  final List<KeywordEntity> wordClouds;
  final DateTime date;

  factory GetSentimentAtDateResponse.fromJson(Map<String, dynamic> data) {
    return GetSentimentAtDateResponse(
      sentimentStat: data['sentimentStat'],
      tweets: _mapToTweets(List<Map<String, dynamic>>.from(data['tweets'])),
      wordClouds: _mapToKeywords(List<List<dynamic>>.from(data['word_cloud'])),
      date: DateTime.parse(data['date']),
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
