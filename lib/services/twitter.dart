import 'dart:async';

import 'package:sis_group6/credentials.dart';
import 'package:sis_group6/domain/entities/tweet.dart';
import 'package:twitter_api_v2/twitter_api_v2.dart' as v2;

class TwitterService {
  TwitterService();

  final twitter = v2.TwitterApi(
    bearerToken: Credentials.BEARER_TOKEN,
    retryConfig: v2.RetryConfig.ofRegularIntervals(
      maxAttempts: 5,
      intervalInSeconds: 3,
    ),
    timeout: const Duration(seconds: 20),
  );

  Future<List<TweetEntity>?> searchRecent(
    String query,
  ) async {
    try {
      final tweets = <TweetEntity>[];
      final response = await twitter.tweetsService.searchRecent(query: query);
      for (var element in response.data) {
        tweets.add(TweetEntity.from(element));
      }
      return tweets;
    } on TimeoutException catch (e) {
      // ignore: avoid_print
      print(e);
      return null;
    } on v2.UnauthorizedException catch (e) {
      // ignore: avoid_print
      print(e);
      return null;
    } on v2.RateLimitExceededException catch (e) {
      // ignore: avoid_print
      print(e);
      return null;
    } on v2.TwitterException catch (e) {
      // ignore: avoid_print
      print(e.response.headers);
      // ignore: avoid_print
      print(e.body);
      // ignore: avoid_print
      print(e);
      return null;
    }
  }
}
