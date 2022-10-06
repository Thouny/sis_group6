part of 'sentiment_bloc.dart';

abstract class SentimentState extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitialSentimentState extends SentimentState {}

class LoadingSentimentState extends SentimentState {}

class LoadedSentimentState extends SentimentState {
  LoadedSentimentState({
    required this.positiveSentiment,
    required this.negativeSentiment,
    required this.sentimentOverview,
  });

  final int positiveSentiment;
  final int negativeSentiment;
  final String sentimentOverview;

  @override
  List<Object?> get props =>
      [positiveSentiment, negativeSentiment, sentimentOverview];
}

class FailedSentimentState extends SentimentState {
  FailedSentimentState(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}
