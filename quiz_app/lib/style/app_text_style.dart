import 'package:flutter/material.dart';
import 'package:quiz_app/style/app_color.dart';

abstract class AppTextStyle {
  static const h1regular24 = TextStyle(
    fontSize: 24,
    fontFamily: 'Gilroy',
    fontWeight: FontWeight.w500,
    color: AppColors.mainViolet,
  );
  static const h6regular22 = TextStyle(
    fontSize: 22,
    fontFamily: 'Gilroy',
    fontWeight: FontWeight.w500,
    color: AppColors.white,
  );

  static const h2regular18 = TextStyle(
    fontSize: 18,
    fontFamily: 'Gilroy',
    fontWeight: FontWeight.w500,
    color: AppColors.mainViolet,
  );
  static const h4regular20 = TextStyle(
    height: 2,
    fontSize: 20,
    fontFamily: 'Gilroy',
    fontWeight: FontWeight.w500,
    color: AppColors.mainViolet,
  );

  static const h3regular16 = TextStyle(
    fontSize: 16,
    fontFamily: 'Gilroy',
    color: AppColors.mainViolet,
  );

  static const h4regular12 = TextStyle(
    fontSize: 12,
    fontFamily: 'Gilroy',
    color: AppColors.mainViolet,
  );
}
