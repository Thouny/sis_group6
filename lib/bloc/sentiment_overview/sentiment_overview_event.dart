part of 'sentiment_overview_bloc.dart';

abstract class SentimentOverviewEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetSentimentOverview extends SentimentOverviewEvent {
  GetSentimentOverview({required this.query});

  final String query;

  @override
  List<Object?> get props => [];
}
