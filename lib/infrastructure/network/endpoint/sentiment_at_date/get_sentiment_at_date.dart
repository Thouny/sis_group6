import 'package:equatable/equatable.dart';
import 'package:sis_group6/infrastructure/network/endpoint/base/endpoint.dart';
import 'package:sis_group6/infrastructure/network/models/get_sentiment_at_date_response.dart';

class GetSentimentAtDate extends Equatable
    with Endpoint<GetSentimentAtDateResponse> {
  const GetSentimentAtDate();

  @override
  Map<String, String> get body => {};

  @override
  ContentType get contentType => ContentType.json;

  @override
  GetSentimentAtDateResponse decode(HttpResponse response) {
    final json = checkResponseStatus(response).data;
    return GetSentimentAtDateResponse.fromJson(json);
  }

  @override
  Map<String, String> get header => {};

  @override
  String get host => '127.0.0.1:5000';

  @override
  HttpMethod get method => HttpMethod.get;

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
  Map<String, dynamic> get queryParameters => <String, dynamic>{};

  @override
  Scheme get scheme => Scheme.http;
}
