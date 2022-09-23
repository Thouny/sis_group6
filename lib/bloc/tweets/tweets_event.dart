part of 'tweets_bloc.dart';

abstract class TweetsEvent extends Equatable {}

class SearchTweetsEvent extends TweetsEvent {
  SearchTweetsEvent(this.query);

  final String query;

  @override
  List<Object?> get props => [query];
}
