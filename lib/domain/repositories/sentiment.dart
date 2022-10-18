import 'package:get_it/get_it.dart';
import 'package:sis_group6/infrastructure/network/models/get_sentiment_at_date_response.dart';
import 'package:sis_group6/infrastructure/network/models/get_sentiment_reddit_response.dart';
import 'package:sis_group6/infrastructure/network/models/get_sentiment_response.dart';
import 'package:sis_group6/services/sentiment.dart';

abstract class SentimentRepository {
  Future<GetSentimentResponse?> getSentiment(String query);
  Future<GetSentimentRedditResponse?> getRedditSentiment(String query);
  Future<GetSentimentAtDateResponse?> getSentimentAtDate(
    String query, {
    required int daysToSubstract,
  });
}

class SentimentRepositoryImpl extends SentimentRepository {
  final _sentimentService = GetIt.I<SentimentService>();

  @override
  Future<GetSentimentResponse?> getSentiment(String query) async {
    return _sentimentService.getSentiment(query);
  }

  @override
  Future<GetSentimentRedditResponse?> getRedditSentiment(String query) async {
    return _sentimentService.getRedditSentiment(query);
  }

  @override
  Future<GetSentimentAtDateResponse?> getSentimentAtDate(
    String query, {
    required int daysToSubstract,
  }) async {
    return _sentimentService.getSentimentAtDate(
      query,
      daysToSubstract: daysToSubstract,
    );
  }
}
