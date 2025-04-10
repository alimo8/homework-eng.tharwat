import 'package:flutter/material.dart';
import 'package:quiz_app/style/app_color.dart';
import 'package:quiz_app/style/app_text_style.dart';

class CustomBottom extends StatelessWidget {
  const CustomBottom({super.key, this.onPressed, required this.label});

  final void Function()? onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: SizedBox(
        height: 50,
        width: double.infinity,
        child: Card(
          color:
              onPressed != null
                  ? AppColors.secondaryViolet
                  : AppColors.backGrad,
          child: Center(child: Text(label, style: AppTextStyle.h1regular24)),
        ),
      ),
    );
  }
}
