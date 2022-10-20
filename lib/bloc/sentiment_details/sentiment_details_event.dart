part of 'sentiment_details_bloc.dart';

abstract class SentimentDetailsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetSentimentDetailsEvent extends SentimentDetailsEvent {
  GetSentimentDetailsEvent({
    required this.query,
    required this.selectedSocialMedia,
  });

  final String query;
  final List<SocialMediaModel> selectedSocialMedia;

  @override
  List<Object?> get props => [query, selectedSocialMedia];
}
