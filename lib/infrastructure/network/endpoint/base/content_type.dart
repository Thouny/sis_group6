part of 'endpoint.dart';

enum ContentType { json, xml, form }

extension ContentTypeExtension on ContentType {
  String get value {
    switch (this) {
      case ContentType.json:
        return 'application/json';
      case ContentType.xml:
        return 'application/xml';
      case ContentType.form:
        return 'application/x-www-form-urlencoded';
    }
  }
}
