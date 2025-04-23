import 'package:flutter/material.dart';
import 'package:aliapp/constants/app_constants.dart';
import 'package:aliapp/screens/news_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants.appTitle,
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      home: const NewsScreen(),
    );
  }
}
