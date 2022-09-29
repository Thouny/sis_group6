import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:sis_group6/infrastructure/network/client/network.dart';
import 'package:sis_group6/infrastructure/network/endpoint/sentiment/get_sentiment.dart';
import 'package:sis_group6/infrastructure/network/endpoint/sentiment/post_sentiment.dart';
import 'package:sis_group6/infrastructure/network/models/get_sentiment_response.dart';
import 'package:sis_group6/infrastructure/network/models/post_sentiment_response.dart';

class SentimentService {
  final _networkClient = GetIt.I<NetworkClient>();

  Future<int?> getSentiment(String query) async {
    try {
      final postEndpoint = PostSentiment(query: query);
      const getEndpoint = GetSentiment();

      await _networkClient
          .send<PostSentimentResponse, PostSentiment>(postEndpoint);
      final response = await _networkClient
          .send<GetSentimentResponse, GetSentiment>(getEndpoint);
      return response.sentimentStat;
    } catch (err, stack) {
      // ignore: avoid_print
      print(err);
      return null;
    }
  }
}
