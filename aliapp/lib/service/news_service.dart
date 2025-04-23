import 'package:aliapp/model/news.model.dart';
import 'package:dio/dio.dart';

class NewsService {
  final Dio dio;
  NewsService({required this.dio});
  Future<List<NewsModel>> getNews() async {
    try {
      var response = await dio.get(
        'https://newsapi.org/v2/top-headlines?country=us&apiKey=ce97c6381e9448c8bd70523c8426bfe5',
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> data = response.data;
        final List<dynamic> articles = data['articles'];
        return articles.map((article) => NewsModel.fromJson(article)).toList();
      }
      throw Exception('Failed to load news');
    } catch (e) {
      return [];
    }
  }
}
