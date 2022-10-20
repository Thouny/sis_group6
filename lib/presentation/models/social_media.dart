import 'package:equatable/equatable.dart';
import 'package:sis_group6/core/enums/source.dart';

class SocialMediaModel extends Equatable {
  const SocialMediaModel({required this.source, required this.id});

  final Source source;
  final int id;

  @override
  List<Object?> get props => [source, id];
}
