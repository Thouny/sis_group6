import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:sis_group6/domain/repositories/sentiment.dart';

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
        final positiveSentiment = result.sentimentStat;
        final negativeSentiment = 100 - positiveSentiment;
        final tweets = result.tweets;
        final keyword = result.wordClouds;
        emit(LoadedSentimentDetailsState(
          positiveSentiment: positiveSentiment,
          negativeSentiment: negativeSentiment,
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
