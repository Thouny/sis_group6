part of 'social_media_bloc.dart';

abstract class SocialMediaState extends Equatable {
  const SocialMediaState();

  @override
  List<Object?> get props => [];
}

class LoadedSociaMediaState extends SocialMediaState {
  const LoadedSociaMediaState({
    this.selectedSources = const <SocialMediaModel?>[
      SocialMediaModel(source: Source.twitter, id: 1),
    ],
    this.socialMedia = const [
      SocialMediaModel(source: Source.twitter, id: 1),
      SocialMediaModel(source: Source.reddit, id: 2),
    ],
  });

  final List<SocialMediaModel?> socialMedia;
  final List<SocialMediaModel?> selectedSources;

  @override
  List<Object?> get props => [socialMedia, selectedSources];
}
