import 'package:sis_group6/domain/entities/reddit_comment.dart';
import 'package:sis_group6/domain/entities/keyword.dart';
import 'package:sis_group6/infrastructure/network/models/base_sentiment_response.dart';

class GetSentimentRedditResponse extends BaseSentimentResponse {
  const GetSentimentRedditResponse({
    required super.sentimentStat,
    required super.mentions,
    required super.wordClouds,
  });

  factory GetSentimentRedditResponse.fromJson(Map<String, dynamic> data) {
    return GetSentimentRedditResponse(
      sentimentStat: data['sentimentStat'],
      mentions: _mapToComments(
        List<Map<String, dynamic>>.from(data['comments']),
      ),
      wordClouds: _mapToKeywords(List<List<dynamic>>.from(data['word_cloud'])),
    );
  }

  static List<RedditCommentEntity> _mapToComments(
    List<Map<String, dynamic>> data,
  ) {
    final comments = <RedditCommentEntity>[];
    for (final element in data) {
      comments.add(RedditCommentEntity.fromMap(element));
    }
    return comments;
  }

  static List<KeywordEntity> _mapToKeywords(List<List<dynamic>> data) {
    final keywords = <KeywordEntity>[];
    for (final element in data) {
      keywords.add(KeywordEntity.fromJson(element));
    }
    return keywords;
  }
}
