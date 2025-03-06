import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
    required this.width,
    required this.height,
    required this.color,
    required this.text,
    required this.textColor,
  });
  final double width, height;
  final Color color;
  final Color textColor;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: color,
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
      ),
    );
  }
}

class CustomContainer2 extends StatelessWidget {
  const CustomContainer2({
    super.key,
    required this.width,
    required this.height,
    required this.color,
    required this.text,
    required this.textColor,
    required this.text2,
  });
  final double width, height;
  final Color color;
  final Color textColor;
  final String text;
  final String text2;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: color,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
            Text(
              text2,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
