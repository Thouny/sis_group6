part of 'sentiment_bloc.dart';

abstract class SentimentEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetSentimentEvent extends SentimentEvent {
  GetSentimentEvent({required this.query});

  final String query;

  @override
  List<Object?> get props => [];
}
