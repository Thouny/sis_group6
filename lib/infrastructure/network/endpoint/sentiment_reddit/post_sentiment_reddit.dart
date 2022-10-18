import 'package:equatable/equatable.dart';
import 'package:sis_group6/infrastructure/network/endpoint/base/endpoint.dart';
import 'package:sis_group6/infrastructure/network/models/post_sentiment_reddit_response.dart';

class PostSentimentReddit extends Equatable
    with Endpoint<PostSentimentRedditResponse> {
  PostSentimentReddit({required String query}) : _query = query;

  final String _query;

  @override
  Map<String, String> get body => {'query': _query};

  @override
  ContentType get contentType => ContentType.json;

  @override
  PostSentimentRedditResponse decode(HttpResponse response) {
    return PostSentimentRedditResponse.fromJson(response.data);
  }

  @override
  Map<String, String> get header => {};

  @override
  String get host => '127.0.0.1:5000';

  @override
  HttpMethod get method => HttpMethod.post;

  @override
  String get path => 'sentimentReddit';

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
