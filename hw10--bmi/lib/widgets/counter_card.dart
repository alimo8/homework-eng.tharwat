import 'package:flutter/material.dart';

class CounterCard extends StatelessWidget {
  const CounterCard({
    super.key,
    required this.text,
    required this.value,
    this.onDecrement,
    this.onIncrement,
  });
  final String text;
  final int value;
  final void Function()? onDecrement;
  final void Function()? onIncrement;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Color(0xFF1D1E33),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(text, style: TextStyle(fontSize: 18, color: Colors.white)),
          SizedBox(height: 20),
          Text(
            value.toString(),
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                onPressed: onDecrement,
                backgroundColor: Colors.grey[700],
                child: Icon(Icons.remove, color: Colors.white),
                mini: true,
              ),
              SizedBox(width: 10),
              FloatingActionButton(
                onPressed: onIncrement,
                backgroundColor: Colors.grey[700],
                child: Icon(Icons.add, color: Colors.white),
                mini: true,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
