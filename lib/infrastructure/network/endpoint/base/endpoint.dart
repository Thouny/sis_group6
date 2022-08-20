import 'package:sis_group6/core/extensions/iterable.dart';

part 'scheme.dart';
part 'http_method.dart';
part 'content_type.dart';
part 'uri_query_item.dart';
part 'http_response.dart';

abstract class Endpoint<T> {
  Scheme get scheme;
  HttpMethod get method;
  ContentType get contentType;
  Map<String, String> get header;
  String get host;
  String get path;
  List<UriQueryItem> get queries;
  Map<String, dynamic> get body;

  T decode(HttpResponse response);
}

extension Default on Endpoint {
  String? get encodeQueries {
    if (queries.isEmpty) return null;
    return queries.compactMap((item) {
      final value = item.value;
      if (value == null) return null;
      return '${item.name}=$value';
    }).reduce((value, element) => '$value&$element');
  }

  HttpResponse checkResponseStatus(HttpResponse response) {
    switch (response.statusCode) {
      case 200:
        return response;
      case 204:
        return response;
      case 400:
        throw Exception('${response.statusCode} Bad Request');
      case 401:
        throw Exception('${response.statusCode} Unauthorized');
      case 403:
        throw Exception('${response.statusCode} Forbidden');
      case 404:
        throw Exception('${response.statusCode} Not found');
      case 408:
        throw Exception('${response.statusCode} Request Timeout');
      default:
        throw Exception('HTTP response failed : code ${response.statusCode}');
    }
  }
}
