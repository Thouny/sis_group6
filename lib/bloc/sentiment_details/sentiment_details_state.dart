part of 'sentiment_details_bloc.dart';

abstract class SentimentDetailsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitialSentimentDetailsState extends SentimentDetailsState {}

class LoadingSentimentDetailsState extends SentimentDetailsState {}

class LoadedSentimentDetailsState extends SentimentDetailsState {
  LoadedSentimentDetailsState({
    required this.positiveSentiment,
    required this.negativeSentiment,
  });

  final int positiveSentiment;
  final int negativeSentiment;

  @override
  List<Object?> get props => [positiveSentiment, negativeSentiment];
}

class FailedSentimentDetailsState extends SentimentDetailsState {
  FailedSentimentDetailsState(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}
