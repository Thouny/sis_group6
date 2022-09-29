class GetSentimentResponse {
  const GetSentimentResponse({required this.sentimentStat});

  final int sentimentStat;

  factory GetSentimentResponse.fromJson(Map<String, dynamic> data) {
    return GetSentimentResponse(sentimentStat: data['sentimentStat']);
  }
}
