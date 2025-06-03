import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key,
      this.InputType,
      this.hintText,
      this.onChanged,
      this.obscureText = false});
  String? hintText;
  Function(String)? onChanged;
  bool? obscureText;
  TextInputType? InputType;
  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: InputType,
      obscureText: obscureText!,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(),
          borderRadius: BorderRadius.circular(8),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
