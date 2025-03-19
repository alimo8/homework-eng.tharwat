import 'package:flutter/material.dart';

class EvenOddSection extends StatelessWidget {
  const EvenOddSection({
    super.key,
    required this.number,
    required this.text,
    required this.color,
    required this.sizeFont,
  });
  final int number;
  final String text;
  final Color color;
  final double sizeFont;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 100,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "$text: ",
            style: TextStyle(color: Colors.white, fontSize: sizeFont),
          ),
          Text(
            "$number",
            style: TextStyle(color: Colors.white, fontSize: sizeFont),
          ),
        ],
      ),
    );
  }
}
