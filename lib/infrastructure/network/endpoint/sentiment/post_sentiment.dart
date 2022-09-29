import 'package:equatable/equatable.dart';
import 'package:sis_group6/infrastructure/network/endpoint/base/endpoint.dart';
import 'package:sis_group6/infrastructure/network/models/post_sentiment_response.dart';

class PostSentiment extends Equatable with Endpoint<PostSentimentResponse> {
  PostSentiment({required String query}) : _query = query;

  final String _query;

  @override
  Map<String, String> get body => {'query': _query};

  @override
  ContentType get contentType => ContentType.json;

  @override
  PostSentimentResponse decode(HttpResponse response) {
    return PostSentimentResponse.fromJson(response.data);
  }

  @override
  Map<String, String> get header => {};

  @override
  String get host => '127.0.0.1:5000';

  @override
  HttpMethod get method => HttpMethod.post;

  @override
  String get path => 'sentiment';

  @override
  List<Object> get props => [
        scheme,
        method,
        contentType,
        header,
        host,
        path,
        queryParameters,
        body,
      ];

  @override
  Map<String, dynamic> get queryParameters => <String, dynamic>{
        'query': _query,
      };

  @override
  Scheme get scheme => Scheme.http;
}
