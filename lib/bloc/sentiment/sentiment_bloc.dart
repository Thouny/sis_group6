import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:sis_group6/domain/repositories/sentiment.dart';
import 'package:sis_group6/infrastructure/network/open_ai.dart';

part 'sentiment_event.dart';
part 'sentiment_state.dart';

class SentimentBloc extends Bloc<SentimentEvent, SentimentState> {
  SentimentBloc() : super(InitialSentimentState()) {
    on<GetSentimentEvent>(_onGetSentiment);
  }

  final _sentimentRepo = GetIt.I<SentimentRepository>();
  final openAIService = OpenAiService();

  FutureOr<void> _onGetSentiment(
    GetSentimentEvent event,
    Emitter<SentimentState> emit,
  ) async {
    try {
      emit(LoadingSentimentState());
      final positiveSentiment = await _sentimentRepo.getSentiment(event.query);
      final negativeSentiment = positiveSentiment;
      String rawCompletion = await openAIService.submitPrompt(event.query);
      final sentimentOverview = rawCompletion.trim();
      if (positiveSentiment != null) {
        final negativeSentiment = 100 - positiveSentiment;
        emit(LoadedSentimentState(
          positiveSentiment: positiveSentiment,
          negativeSentiment: negativeSentiment,
          sentimentOverview: sentimentOverview,
        ));
      } else if (positiveSentiment == null && negativeSentiment == null) {
        emit(LoadedSentimentState(
          sentimentOverview: sentimentOverview,
          negativeSentiment: 1,
          positiveSentiment: 1,
        ));
      } else {
        emit(FailedSentimentState('No data available'));
      }
    } catch (err) {
      // ignore: avoid_print
      print(err.toString());
      emit(FailedSentimentState(err.toString()));
    }
  }
}
