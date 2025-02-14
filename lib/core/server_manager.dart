import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/models/news_model.dart';

String baseUrl = 'https://newsapi.org/v2/top-headlines';
String apiKey = 'b6a5afa9432f453eb390feef2c404f3b';
String sources = 'techcrunch';

Future<NewsModel> getNews(int index) async {
  final response = await http.get(
    Uri.parse('$baseUrl?sources=$sources&apiKey=$apiKey'),
  );

  Map<String, dynamic> data = jsonDecode(response.body);

  return NewsModel.fromJson(data, index);
}

Future<List<NewsModel>> getAllNews() async {
  final response = await http.get(
    Uri.parse('$baseUrl?sources=$sources&apiKey=$apiKey'),
  );
  Map<String, dynamic> data = jsonDecode(response.body);
  return NewsModel.getAllNews(data);
}
