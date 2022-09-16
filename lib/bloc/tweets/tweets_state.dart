part of 'tweets_bloc.dart';

abstract class TweetsState extends Equatable {
  const TweetsState();

  @override
  List<Object?> get props => [];
}

class InitialTweetsState extends TweetsState {
  const InitialTweetsState();
}

class LoadingTweetsState extends TweetsState {
  const LoadingTweetsState();
}

class LoadedTweetsState extends TweetsState {
  const LoadedTweetsState(this.tweets);

  final List<TweetEntity> tweets;

  @override
  List<Object?> get props => [tweets];
}

class EmptyTweetsState extends TweetsState {
  const EmptyTweetsState();
}

class FailedTweetsState extends TweetsState {
  const FailedTweetsState(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}
