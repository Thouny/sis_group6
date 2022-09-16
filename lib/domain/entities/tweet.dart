import 'package:equatable/equatable.dart';
import 'package:twitter_api_v2/twitter_api_v2.dart';

class TweetEntity extends Equatable {
  const TweetEntity({
    required this.id,
    required this.text,
    this.source,
    this.language,
    this.createdAt,
  });

  factory TweetEntity.from(TweetData data) {
    return TweetEntity(
      id: data.id,
      text: data.text,
      source: data.source,
      language: data.lang,
      createdAt: data.createdAt,
    );
  }

  final String id;

  final String text;

  /// Determine if a Twitter user posted from the web, mobile device, or
  /// other app.
  final String? source;

  final TweetLanguage? language;

  final DateTime? createdAt;

  @override
  List<Object?> get props => [id, text, source, language, createdAt];
}
