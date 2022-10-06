part of 'sentiment_details_bloc.dart';

abstract class SentimentDetailsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetSentimentDetailsEvent extends SentimentDetailsEvent {
  GetSentimentDetailsEvent({required this.query});

  final String query;

  @override
  List<Object?> get props => [];
}
