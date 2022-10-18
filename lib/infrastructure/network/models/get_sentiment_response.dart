import 'package:sis_group6/domain/entities/tweet.dart';
import 'package:sis_group6/domain/entities/keyword.dart';
import 'package:sis_group6/infrastructure/network/models/base_sentiment_response.dart';

class GetSentimentResponse extends BaseSentimentResponse {
  const GetSentimentResponse({
    required super.sentimentStat,
    required super.mentions,
    required super.wordClouds,
  });

  factory GetSentimentResponse.fromJson(Map<String, dynamic> data) {
    return GetSentimentResponse(
      sentimentStat: data['sentimentStat'],
      mentions: _mapToTweets(List<Map<String, dynamic>>.from(data['tweets'])),
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
