import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:aliapp/constants/app_constants.dart';
import 'package:aliapp/widgets/news_card.dart';
import 'package:aliapp/model/news.model.dart';
import 'package:aliapp/service/news_service.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  late NewsService _newsService;
  List<NewsModel> _news = [];

  @override
  void initState() {
    super.initState();
    _newsService = NewsService(dio: Dio());
    _loadNews();
  }

  Future<void> _loadNews() async {
    final news = await _newsService.getNews();
    setState(() {
      _news = news;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppConstants.newsTitle),
        centerTitle: true,
        actions: [IconButton(icon: const Icon(Icons.search), onPressed: () {})],
      ),
      body: ListView.builder(
        itemCount: _news.length,
        itemBuilder: (context, index) => NewsCard(newsModel: _news[index]),
      ),
    );
  }
}
