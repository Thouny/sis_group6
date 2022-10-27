import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:sis_group6/domain/entities/keyword.dart';

class KeywordModel extends Equatable {
  const KeywordModel({
    required this.text,
    required this.color,
    required this.size,
    required this.isRotated,
  });

  factory KeywordModel.fromEntity(
    KeywordEntity entity,
    Color color,
    bool isRotated,
  ) {
    return KeywordModel(
      text: entity.text,
      color: color,
      size: entity.size * 3,
      isRotated: isRotated,
    );
  }

  final String text;
  final Color color;
  final int size;
  final bool isRotated;

  KeywordModel copyWith({
    String? text,
    Color? color,
    int? size,
    bool? isRotated,
  }) {
    return KeywordModel(
      text: text ?? this.text,
      color: color ?? this.color,
      size: size ?? this.size,
      isRotated: isRotated ?? this.isRotated,
    );
  }

  @override
  List<Object?> get props => [text];
}
