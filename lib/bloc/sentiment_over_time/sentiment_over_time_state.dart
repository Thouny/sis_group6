part of 'sentiment_over_time_bloc.dart';

abstract class SentimentOverTimeState extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitialSentimentOverTimeState extends SentimentOverTimeState {}

class LoadingSentimentOverTimeState extends SentimentOverTimeState {}

class LoadedSentimentOverTimeState extends SentimentOverTimeState {
  LoadedSentimentOverTimeState({
    required this.sentimentOverTime,
    required this.evolution,
  });

  final List<SentimentAtDateGraphData> sentimentOverTime;
  final double? evolution;

  @override
  List<Object?> get props => [sentimentOverTime, evolution];
}

class FailedSentimentOverTimeState extends SentimentOverTimeState {
  FailedSentimentOverTimeState(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}
