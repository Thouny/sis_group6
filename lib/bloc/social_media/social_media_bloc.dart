import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sis_group6/core/enums/source.dart';
import 'package:sis_group6/presentation/models/social_media.dart';

part 'social_media_event.dart';
part 'social_media_state.dart';

class SocialMediaBloc extends Bloc<SocialMediaEvent, SocialMediaState> {
  SocialMediaBloc() : super(const LoadedSociaMediaState()) {
    on<SelectSocialMediaEvent>(_onSelectSocialMedia);
  }

  FutureOr<void> _onSelectSocialMedia(
    SelectSocialMediaEvent event,
    Emitter<SocialMediaState> emit,
  ) async {
    if (state is LoadedSociaMediaState) {
      if (event.selectedSocialMedia.isEmpty) {
        // don't allow all social media to be unselected
        return null;
      }
      emit(LoadedSociaMediaState(selectedSources: event.selectedSocialMedia));
    }
  }
}
