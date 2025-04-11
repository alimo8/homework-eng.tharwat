import 'package:flutter/material.dart';
import 'package:quiz_app/style/app_text_style.dart';

class TransparentBackButton extends StatelessWidget {
  const TransparentBackButton({super.key, this.onPressed});

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: SizedBox(
        height: 50,
        width: double.infinity,
        child: Card(
          color: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(
              color: onPressed != null ? Colors.white : Colors.grey,
              width: 1,
            ),
          ),
          child: Center(
            child: Text(
              'Back',
              style: AppTextStyle.h1regular24.copyWith(
                color: onPressed != null ? Colors.white : Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
