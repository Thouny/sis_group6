part of 'endpoint.dart';

class HttpResponse {
  const HttpResponse({required this.statusCode, required this.data});

  final int statusCode;
  final Map<String, dynamic> data;
}
