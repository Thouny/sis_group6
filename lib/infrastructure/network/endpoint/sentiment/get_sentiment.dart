import 'package:equatable/equatable.dart';
import 'package:sis_group6/infrastructure/network/endpoint/base/endpoint.dart';
import 'package:sis_group6/infrastructure/network/models/get_sentiment_response.dart';

class GetSentiment extends Equatable with Endpoint<GetSentimentResponse> {
  const GetSentiment();

  @override
  Map<String, String> get body => {};

  @override
  ContentType get contentType => ContentType.json;

  @override
  GetSentimentResponse decode(HttpResponse response) {
    final json = checkResponseStatus(response).data;
    return GetSentimentResponse.fromJson(json);
  }

  @override
  Map<String, String> get header => {};

  @override
  String get host => '127.0.0.1:5000';

  @override
  HttpMethod get method => HttpMethod.get;

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
  Map<String, dynamic> get queryParameters => <String, dynamic>{};

  @override
  Scheme get scheme => Scheme.http;
}
