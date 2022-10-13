import 'package:equatable/equatable.dart';
import 'package:sis_group6/infrastructure/network/endpoint/base/endpoint.dart';
import 'package:sis_group6/infrastructure/network/models/post_sentiment_at_date_response.dart';

class PostSentimentAtDate extends Equatable
    with Endpoint<PostSentimentAtDateResponse> {
  PostSentimentAtDate({
    required String query,
    required String daysToSubstract,
  })  : _query = query,
        _daysToSubstract = daysToSubstract;

  final String _query;
  final String _daysToSubstract;

  @override
  Map<String, String> get body => {
        'query': _query,
        'days_to_substract': _daysToSubstract,
      };

  @override
  ContentType get contentType => ContentType.json;

  @override
  PostSentimentAtDateResponse decode(HttpResponse response) {
    return PostSentimentAtDateResponse.fromJson(response.data);
  }

  @override
  Map<String, String> get header => {};

  @override
  String get host => '127.0.0.1:5000';

  @override
  HttpMethod get method => HttpMethod.post;

  @override
  String get path => 'sentimentAtDate';

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
        'days_to_substract': _daysToSubstract,
      };

  @override
  Scheme get scheme => Scheme.http;
}
