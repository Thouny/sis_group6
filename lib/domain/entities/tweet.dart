import 'package:equatable/equatable.dart';
import 'package:sis_group6/core/enums/sentiment.dart';

class TweetEntity extends Equatable {
  const TweetEntity({
    required this.id,
    required this.text,
    this.createdAt,
    this.sentiment,
  });

  factory TweetEntity.fromMap(Map<String, dynamic> data) {
    return TweetEntity(
      id: data['id'],
      text: data['text'],
      sentiment: SentimentConverter.convertFrom(data['sentiment']),
    );
  }

  final String id;

  final String text;

  final DateTime? createdAt;

  final Sentiment? sentiment;

  @override
  List<Object?> get props => [
        id,
        text,
        createdAt,
        sentiment,
      ];
}
