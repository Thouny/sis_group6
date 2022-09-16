import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:sis_group6/core/consts/app.dart';
import 'package:sis_group6/domain/entities/tweet.dart';
import 'package:sis_group6/domain/repositories/twitter_repository.dart';

part 'tweets_event.dart';
part 'tweets_state.dart';

class TweetsBloc extends Bloc<TweetsEvent, TweetsState> {
  TweetsBloc() : super(const InitialTweetsState()) {
    on<SearchTweetsEvent>(_onLoadTweets);
  }

  final _twitterRepository = GetIt.I<TwitterRepository>();
  final errorMessage = AppConsts.unavailableContent;

  FutureOr<void> _onLoadTweets(
    SearchTweetsEvent event,
    Emitter<TweetsState> emit,
  ) async {
    try {
      emit(const LoadingTweetsState());
      final tweets = await _twitterRepository.searchTweets(event.query);
      if (tweets != null) {
        if (tweets.isNotEmpty) {
          emit(LoadedTweetsState(tweets));
        } else {
          emit(const EmptyTweetsState());
        }
      } else {
        emit(FailedTweetsState(errorMessage));
      }
    } catch (err) {
      print(err);
      emit(FailedTweetsState(err.toString()));
    }
  }
}
