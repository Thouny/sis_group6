class PostSentimentAtDateResponse {
  const PostSentimentAtDateResponse({
    required this.query,
    required this.daysToSubstract,
  });

  final String query;
  final String daysToSubstract;

  factory PostSentimentAtDateResponse.fromJson(Map<String, dynamic> data) {
    return PostSentimentAtDateResponse(
      query: data['query'],
      daysToSubstract: data['days_to_substract'],
    );
  }
}
