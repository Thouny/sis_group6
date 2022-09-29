import 'package:get_it/get_it.dart';
import 'package:sis_group6/services/sentiment.dart';

abstract class SentimentRepository {
  Future<int?> getSentiment(String query);
}

class SentimentRepositoryImpl extends SentimentRepository {
  final _sentimentService = GetIt.I<SentimentService>();

  @override
  Future<int?> getSentiment(String query) async {
    return _sentimentService.getSentiment(query);
  }
}
