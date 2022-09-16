import 'package:get_it/get_it.dart';
import 'package:sis_group6/domain/entities/tweet.dart';
import 'package:sis_group6/services/twitter.dart';

abstract class TwitterRepository {
  Future<List<TweetEntity>?> searchTweets(String query);
}

class TwitterRepositoryImpl extends TwitterRepository {
  final _twitterService = GetIt.I<TwitterService>();

  @override
  Future<List<TweetEntity>?> searchTweets(String query) async {
    return _twitterService.searchRecent(query);
  }
}
