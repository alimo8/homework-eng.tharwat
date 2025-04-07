import 'package:flutter/material.dart';
import 'package:quiz_app/style/app_color.dart';
import 'package:quiz_app/view/start_view.dart';

void main() {
  runApp(MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: AppColors.casperViolet),
      home: StartView(),
    );
  }
}
