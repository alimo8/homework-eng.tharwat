import 'package:aliapp/model/news.model.dart';
import 'package:flutter/material.dart';
import 'package:aliapp/constants/app_constants.dart';

class NewsCard extends StatelessWidget {
  final NewsModel newsModel;

  const NewsCard({super.key, required this.newsModel});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(
        horizontal: AppConstants.cardHorizontalMargin,
        vertical: AppConstants.cardVerticalMargin,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: AppConstants.cardImageHeight,
            width: double.infinity,
            color: Colors.grey[300],
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.network(
                  newsModel.image ?? '',
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(Icons.image, size: 48, color: Colors.grey);
                  },
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(AppConstants.cardPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  newsModel.title,
                  style: const TextStyle(
                    fontSize: AppConstants.titleFontSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: AppConstants.spacing),
                Text(
                  newsModel.description ?? 'No Description',
                  style: const TextStyle(
                    fontSize: AppConstants.descriptionFontSize,
                    color: AppConstants.unselectedColor,
                  ),
                ),
                SizedBox(height: AppConstants.spacing),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.bookmark_border),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
