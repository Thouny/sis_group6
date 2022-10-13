part of 'sentiment_over_time_bloc.dart';

abstract class SentimentOverTimeEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetSentimentFromLastSevenDaysEvent extends SentimentOverTimeEvent {
  GetSentimentFromLastSevenDaysEvent({required this.query});

  final String query;

  @override
  List<Object?> get props => [];
}
