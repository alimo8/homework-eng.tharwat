import 'package:flutter/material.dart';

class ActionButton extends StatefulWidget {
  final IconData icon;
  final String label;
  final Color color;

  const ActionButton(
      {super.key,
      required this.icon,
      required this.label,
      required this.color});

  @override
  // ignore: library_private_types_in_public_api
  _ActionButtonState createState() => _ActionButtonState();
}

class _ActionButtonState extends State<ActionButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: () {
            // Example of stateful behavior
            setState(() {}); // Update UI if needed
          },
          icon: Icon(widget.icon, color: widget.color),
        ),
        Text(
          widget.label,
          style: TextStyle(color: widget.color, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
