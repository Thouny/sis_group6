class PostSentimentResponse {
  const PostSentimentResponse({required this.query});

  final String query;

  factory PostSentimentResponse.fromJson(Map<String, dynamic> data) {
    return PostSentimentResponse(query: data['query']);
  }
}
