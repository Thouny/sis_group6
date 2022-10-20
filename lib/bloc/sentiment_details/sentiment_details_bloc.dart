import 'dart:async';
import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:sis_group6/core/enums/sentiment.dart';
import 'package:sis_group6/core/theme/keyword.dart';
import 'package:sis_group6/domain/entities/mention.dart';
import 'package:sis_group6/domain/repositories/sentiment.dart';
import 'package:sis_group6/infrastructure/network/models/base_sentiment_response.dart';
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
      List<BaseSentimentResponse> results = [];
      final twitterResults = await _sentimentRepo.getSentiment(event.query);
      final redditResults = await _sentimentRepo.getRedditSentiment(
        event.query,
      );
      if (twitterResults != null) {
        results.add(twitterResults);
      }
      if (redditResults != null) {
        results.add(redditResults);
      }

      if (results.isNotEmpty) {
        final positiveSentiment = _getPositiveSentiment(results);

        final negativeSentiment = 100 - positiveSentiment;

        final mentions = _filterRetweets(results);
        final keywords = _generateKeywordModels(results);

        final positiveCount = _getCount(results, Sentiment.positive);
        final negativeCount = _getCount(results, Sentiment.negative);

        emit(LoadedSentimentDetailsState(
          positiveSentiment: positiveSentiment,
          positiveCount: positiveCount,
          negativeSentiment: negativeSentiment,
          negativeCount: negativeCount,
          mentions: mentions,
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
  int _getPositiveSentiment(List<BaseSentimentResponse> results) {
    var sum = 0;
    var total = 0;
    for (final result in results) {
      total = total + result.mentions.length;
      for (final mention in result.mentions) {
        if (mention.sentiment == Sentiment.positive) {
          sum = sum + 1;
        }
      }
    }
    final positiveSentiment = sum / total * 100;
    return positiveSentiment.ceil();
  }

  List<KeywordModel> _generateKeywordModels(
    List<BaseSentimentResponse> results,
  ) {
    final keywords = <KeywordModel>[];
    for (final result in results) {
      for (var entity in result.wordClouds) {
        var newModel = KeywordModel.fromEntity(
          entity,
          KeywordColors.random,
          Random().nextBool(),
        );
        if (!keywords.contains(newModel)) {
          keywords.add(newModel);
        } else {
          final index = keywords.indexOf(newModel);
          final oldModel = keywords[index];
          newModel = oldModel.copyWith(size: oldModel.size + newModel.size);
          keywords[index] = newModel;
        }
      }
    }
    return keywords;
  }

  int _getCount(List<BaseSentimentResponse> results, Sentiment sentiment) {
    var count = 0;
    for (final result in results) {
      for (final tweet in result.mentions) {
        if (tweet.sentiment == sentiment) {
          count++;
        }
      }
    }

    return count;
  }

  List<MentionEntity> _filterRetweets(List<BaseSentimentResponse> results) {
    final filteredMentions = <MentionEntity>[];
    for (final result in results) {
      for (final mention in result.mentions) {
        if (!mention.text.contains('RT ')) {
          filteredMentions.add(mention);
        }
      }
    }

    return filteredMentions;
  }
}
