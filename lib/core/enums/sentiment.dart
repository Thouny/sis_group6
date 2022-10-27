import 'package:flutter/material.dart';

enum Sentiment { positive, negative, unmmapped }

extension Properties on Sentiment {
  String get label {
    switch (this) {
      case Sentiment.positive:
        return 'Positive';
      case Sentiment.negative:
        return 'Negative';
      default:
        return 'Unmapped';
    }
  }

  Color get color {
    switch (this) {
      case Sentiment.positive:
        return const Color.fromARGB(203, 38, 255, 89);
      case Sentiment.negative:
        return const Color.fromARGB(218, 238, 39, 39);
      default:
        return Colors.black;
    }
  }
}

class SentimentConverter {
  static Sentiment convertFrom(String name) {
    switch (name) {
      case 'positive':
        return Sentiment.positive;
      case 'negative':
        return Sentiment.negative;
      default:
        return Sentiment.unmmapped;
    }
  }
}
