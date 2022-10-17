import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:sis_group6/infrastructure/network/client/network.dart';
import 'package:sis_group6/infrastructure/network/endpoint/sentiment/get_sentiment.dart';
import 'package:sis_group6/infrastructure/network/endpoint/sentiment/post_sentiment.dart';
import 'package:sis_group6/infrastructure/network/endpoint/sentiment_at_date/get_sentiment_at_date.dart';
import 'package:sis_group6/infrastructure/network/endpoint/sentiment_at_date/post_sentiment_at_date.dart';
import 'package:sis_group6/infrastructure/network/models/get_sentiment_at_date_response.dart';
import 'package:sis_group6/infrastructure/network/models/get_sentiment_response.dart';
import 'package:sis_group6/infrastructure/network/models/post_sentiment_at_date_response.dart';
import 'package:sis_group6/infrastructure/network/models/post_sentiment_response.dart';

class SentimentService {
  final _networkClient = GetIt.I<NetworkClient>();

  Future<GetSentimentResponse?> getSentiment(String query) async {
    try {
      final postEndpoint = PostSentiment(query: query);
      const getEndpoint = GetSentiment();

      await _networkClient
          .send<PostSentimentResponse, PostSentiment>(postEndpoint);
      final response = await _networkClient
          .send<GetSentimentResponse, GetSentiment>(getEndpoint);

      return response;
    } catch (err) {
      // ignore: avoid_print
      print(err);
      return null;
    }
  }

  Future<GetSentimentAtDateResponse?> getSentimentAtDate(
    String query, {
    required int daysToSubstract,
  }) async {
    try {
      final postEndpoint = PostSentimentAtDate(
        query: query,
        daysToSubstract: daysToSubstract.toString(),
      );
      const getEndpoint = GetSentimentAtDate();

      await _networkClient
          .send<PostSentimentAtDateResponse, PostSentimentAtDate>(postEndpoint);
      final response = await _networkClient
          .send<GetSentimentAtDateResponse, GetSentimentAtDate>(getEndpoint);

      return response;
    } catch (err) {
      // ignore: avoid_print
      print(err);
      return null;
    }
  }
}
