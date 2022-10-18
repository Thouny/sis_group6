import 'package:sis_group6/core/enums/sentiment.dart';
import 'package:sis_group6/core/enums/source.dart';
import 'package:sis_group6/domain/entities/mention.dart';

class TweetEntity extends MentionEntity {
  const TweetEntity({
    required super.text,
    required super.source,
    required super.sentiment,
    required this.id,
    this.createdAt,
  });

  factory TweetEntity.fromMap(Map<String, dynamic> data) {
    return TweetEntity(
      id: data['id'],
      text: data['text'],
      sentiment: SentimentConverter.convertFrom(data['sentiment']),
      source: Source.twitter,
    );
  }

  final String id;

  final DateTime? createdAt;

  @override
  List<Object?> get props => [id, text, createdAt, sentiment, source];
}
