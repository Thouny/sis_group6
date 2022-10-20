import 'package:equatable/equatable.dart';
import 'package:sis_group6/infrastructure/network/endpoint/base/endpoint.dart';
import 'package:sis_group6/infrastructure/network/models/get_sentiment_reddit_response.dart';

class GetSentimentReddit extends Equatable
    with Endpoint<GetSentimentRedditResponse> {
  const GetSentimentReddit();

  @override
  Map<String, String> get body => {};

  @override
  ContentType get contentType => ContentType.json;

  @override
  GetSentimentRedditResponse decode(HttpResponse response) {
    final json = checkResponseStatus(response).data;
    return GetSentimentRedditResponse.fromJson(json);
  }

  @override
  Map<String, String> get header => {};

  @override
  String get host => '127.0.0.1:5000';

  @override
  HttpMethod get method => HttpMethod.get;

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
  Map<String, dynamic> get queryParameters => <String, dynamic>{};

  @override
  Scheme get scheme => Scheme.http;
}
