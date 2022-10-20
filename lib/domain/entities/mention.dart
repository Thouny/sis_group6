import 'package:equatable/equatable.dart';
import 'package:sis_group6/core/enums/sentiment.dart';
import 'package:sis_group6/core/enums/source.dart';

abstract class MentionEntity extends Equatable {
  const MentionEntity({
    required this.text,
    required this.source,
    required this.sentiment,
  });

  final String text;

  final Source source;

  final Sentiment sentiment;

  @override
  List<Object?> get props => [text, source, sentiment];
}
