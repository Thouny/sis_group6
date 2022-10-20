import 'package:sis_group6/core/enums/sentiment.dart';
import 'package:sis_group6/core/enums/source.dart';
import 'package:sis_group6/domain/entities/mention.dart';

class RedditCommentEntity extends MentionEntity {
  const RedditCommentEntity({
    required super.text,
    required super.source,
    required super.sentiment,
    required this.author,
  });

  factory RedditCommentEntity.fromMap(Map<String, dynamic> data) {
    return RedditCommentEntity(
      author: data['author'],
      text: data['comment'],
      sentiment: SentimentConverter.convertFrom(data['sentiment']),
      source: Source.reddit,
    );
  }

  final String author;

  @override
  List<Object?> get props => [text, author, sentiment, source];
}
