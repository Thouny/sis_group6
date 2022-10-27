import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:sis_group6/domain/repositories/sentiment.dart';
import 'package:sis_group6/presentation/models/sentiment_at_date_graph_data.dart';

part 'sentiment_over_time_event.dart';
part 'sentiment_over_time_state.dart';

class SentimentOverTimeBloc
    extends Bloc<SentimentOverTimeEvent, SentimentOverTimeState> {
  SentimentOverTimeBloc() : super(InitialSentimentOverTimeState()) {
    on<GetSentimentFromLastSevenDaysEvent>(_onGetSentiment);
  }

  final _sentimentRepo = GetIt.I<SentimentRepository>();

  FutureOr<void> _onGetSentiment(
    GetSentimentFromLastSevenDaysEvent event,
    Emitter<SentimentOverTimeState> emit,
  ) async {
    try {
      emit(LoadingSentimentOverTimeState());
      final today = DateTime.now().toUtc();
      final sentimentOverTime = <SentimentAtDateGraphData>[];
      final yValues = <double>[];
      for (var i = 7; i >= 1; i--) {
        final result = await _sentimentRepo.getSentimentAtDate(
          event.query,
          daysToSubstract: i,
        );
        final date = DateTime(today.year, today.month, today.day - i);
        sentimentOverTime.add(SentimentAtDateGraphData(
          date,
          result?.sentimentStat.truncateToDouble(),
        ));
        if (result != null) {
          yValues.add(result.sentimentStat.truncateToDouble());
        }
      }

      final evolution = _computeEvolution(yValues);

      emit(LoadedSentimentOverTimeState(
        sentimentOverTime: sentimentOverTime,
        evolution: evolution,
      ));
    } catch (err) {
      // ignore: avoid_print
      print(err.toString());
      emit(FailedSentimentOverTimeState(err.toString()));
    }
  }
}

extension _Helpers on SentimentOverTimeBloc {
  double? _computeEvolution(List<double> yValues) {
    if (yValues.length > 1) {
      final start = yValues.first;
      final last = yValues.last;
      return last - start;
    } else {
      return null;
    }
  }
}
