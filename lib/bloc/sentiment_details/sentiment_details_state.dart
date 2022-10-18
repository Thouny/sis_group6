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
    required this.positiveCount,
    required this.negativeCount,
    required this.mentions,
    required this.keywords,
  });

  final int positiveSentiment;
  final int negativeSentiment;
  final int positiveCount;
  final int negativeCount;
  final List<MentionEntity> mentions;
  final List<KeywordModel> keywords;

  @override
  List<Object?> get props => [
        positiveSentiment,
        negativeSentiment,
        positiveCount,
        negativeCount,
        mentions,
        keywords,
      ];
}

class FailedSentimentDetailsState extends SentimentDetailsState {
  FailedSentimentDetailsState(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}
