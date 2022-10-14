part of 'sentiment_overview_bloc.dart';

abstract class SentimentOverviewState extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitialSentimentOverviewState extends SentimentOverviewState {}

class LoadingSentimentOverviewState extends SentimentOverviewState {}

class LoadedSentimentOverviewState extends SentimentOverviewState {
  LoadedSentimentOverviewState({
    required this.sentimentOverview,
  });

  final String sentimentOverview;

  @override
  List<Object?> get props => [
        sentimentOverview,
      ];
}

class FailedSentimentOverviewState extends SentimentOverviewState {
  FailedSentimentOverviewState(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}
