import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  const Category({
    Key? key,
    required this.text,
    required this.color,
    this.onTap,
  }) : super(key: key);
  final String text;
  final Color color;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.only(left: 16),
        alignment: Alignment.centerLeft,
        width: double.infinity,
        height: 70,
        color: color,
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}
