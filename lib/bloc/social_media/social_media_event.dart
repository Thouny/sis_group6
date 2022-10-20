part of 'social_media_bloc.dart';

abstract class SocialMediaEvent extends Equatable {
  const SocialMediaEvent();

  @override
  List<Object?> get props => [];
}

class SelectSocialMediaEvent extends SocialMediaEvent {
  const SelectSocialMediaEvent(this.selectedSocialMedia);

  final List<SocialMediaModel?> selectedSocialMedia;

  @override
  List<Object?> get props => [selectedSocialMedia];
}
