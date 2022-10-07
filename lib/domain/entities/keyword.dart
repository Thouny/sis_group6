import 'package:equatable/equatable.dart';

class KeywordEntity extends Equatable {
  const KeywordEntity(this.text, this.size);

  factory KeywordEntity.fromJson(List<dynamic> data) {
    return KeywordEntity(data[0], data[1]);
  }

  final String text;
  final int size;

  @override
  List<Object?> get props => [text, size];
}
