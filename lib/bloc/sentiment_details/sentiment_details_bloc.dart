import 'dart:async';
import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:sis_group6/core/enums/sentiment.dart';
import 'package:sis_group6/core/theme/keyword.dart';
import 'package:sis_group6/domain/entities/keyword.dart';
import 'package:sis_group6/domain/entities/tweet.dart';
import 'package:sis_group6/domain/repositories/sentiment.dart';
import 'package:sis_group6/presentation/models/keyword.dart';

part 'sentiment_details_event.dart';
part 'sentiment_details_state.dart';

class SentimentDetailsBloc
    extends Bloc<SentimentDetailsEvent, SentimentDetailsState> {
  SentimentDetailsBloc() : super(InitialSentimentDetailsState()) {
    on<GetSentimentDetailsEvent>(_onGetSentiment);
  }

  final _sentimentRepo = GetIt.I<SentimentRepository>();

  FutureOr<void> _onGetSentiment(
    GetSentimentDetailsEvent event,
    Emitter<SentimentDetailsState> emit,
  ) async {
    try {
      emit(LoadingSentimentDetailsState());
      final result = await _sentimentRepo.getSentiment(event.query);
      if (result != null) {
        final positiveSentiment = result.sentimentStat.ceil();
        final negativeSentiment = 100 - positiveSentiment;

        final tweets = result.tweets;
        final keywords = _generateKeywordModels(result.wordClouds);

        final positiveCount = _getCount(tweets, Sentiment.positive);
        final negativeCount = _getCount(tweets, Sentiment.negative);

        emit(LoadedSentimentDetailsState(
          positiveSentiment: positiveSentiment,
          positiveCount: positiveCount,
          negativeSentiment: negativeSentiment,
          negativeCount: negativeCount,
          tweets: tweets,
          keywords: keywords,
        ));
      } else {
        emit(FailedSentimentDetailsState('No data available'));
      }
    } catch (err) {
      // ignore: avoid_print
      print(err.toString());
      emit(FailedSentimentDetailsState(err.toString()));
    }
  }
}

extension _Helpers on SentimentDetailsBloc {
  List<KeywordModel> _generateKeywordModels(List<KeywordEntity> entities) {
    final keywords = <KeywordModel>[];
    for (var entity in entities) {
      keywords.add(KeywordModel.fromEntity(
        entity,
        KeywordColors.random,
        Random().nextBool(),
      ));
    }
    return keywords;
  }

  int _getCount(List<TweetEntity> tweets, Sentiment sentiment) {
    var count = 0;
    for (final tweet in tweets) {
      if (tweet.sentiment == sentiment) {
        count++;
      }
    }
    return count;
  }
}
