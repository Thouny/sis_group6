class PostSentimentRedditResponse {
  const PostSentimentRedditResponse({required this.query});

  final String query;

  factory PostSentimentRedditResponse.fromJson(Map<String, dynamic> data) {
    return PostSentimentRedditResponse(query: data['query']);
  }
}
