import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum Source { twitter, reddit }

extension Properties on Source {
  Icon get icon {
    switch (this) {
      case Source.twitter:
        return const Icon(FontAwesomeIcons.twitter);
      case Source.reddit:
        return const Icon(FontAwesomeIcons.reddit);
    }
  }
}
