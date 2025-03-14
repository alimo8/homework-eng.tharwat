import 'package:flutter/material.dart';

enum Gender { male, female }

class GenderCard extends StatelessWidget {
  const GenderCard({
    super.key,
    this.onTap,
    required this.icon,
    required this.text,
    required this.isSelected,
  });
  final void Function()? onTap;
  final IconData icon;
  final String text;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(15),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : const Color(0xFF1D1E33),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 80, color: Colors.white),
            Text(text, style: TextStyle(fontSize: 18, color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
