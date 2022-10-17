import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:sis_group6/services/open_ai.dart';

part 'sentiment_overview_event.dart';
part 'sentiment_overview_state.dart';

class SentimentOverviewBloc
    extends Bloc<SentimentOverviewEvent, SentimentOverviewState> {
  SentimentOverviewBloc() : super(InitialSentimentOverviewState()) {
    on<GetSentimentOverview>(_onGetSentimentOverview);
  }

  final _openAIService = GetIt.I<OpenAIService>();

  FutureOr<void> _onGetSentimentOverview(
    GetSentimentOverview event,
    Emitter<SentimentOverviewState> emit,
  ) async {
    try {
      emit(LoadingSentimentOverviewState());
      final sentimentOverview = await _openAIService.submitPrompt(event.query);
      emit(LoadedSentimentOverviewState(sentimentOverview: sentimentOverview));
    } catch (err) {
      // ignore: avoid_print
      print(err.toString());
      emit(FailedSentimentOverviewState(err.toString()));
    }
  }
}
