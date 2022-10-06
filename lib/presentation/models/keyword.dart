import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:sis_group6/domain/entities/keyword.dart';

class KeywordModel extends Equatable {
  const KeywordModel(
    this.text,
    this.color,
    this.size,
    this.isRotated,
  );

  factory KeywordModel.fromEntity(KeywordEntity entity) {
    return KeywordModel(entity.text, Colors.red, entity.size, false);
  }

  final String text;
  final Color color;
  final int size;
  final bool isRotated;

  @override
  List<Object?> get props => [text, color, size, isRotated];
}
