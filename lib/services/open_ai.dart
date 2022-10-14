import 'package:http/http.dart' as http;

class OpenAIService {
  Future<String> submitPrompt(String prompt) async {
    final url =
        'https://australia-southeast1-aiassistant-359803.cloudfunctions.net/open-ai/?prompt=Conduct a sentiment analysis on $prompt and outline the positive and negative feelings people have about it';
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return response.body.toString().trim();
    } else {
      throw Exception('Failed to load');
    }
  }
}
