part of 'endpoint.dart';

class UriQueryItem {
  const UriQueryItem({
    required this.name,
    this.value,
  });

  final String name;
  final String? value;
}
