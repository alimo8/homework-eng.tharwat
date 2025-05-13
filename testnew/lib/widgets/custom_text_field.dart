import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.iconData,
    this.onChanged,
    this.obscureText = false,
    this.validator,
  });
  final String labelText;
  final String hintText;
  final IconData iconData;
  final Function(String)? onChanged;
  final bool obscureText;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // controller: _passwordController,
      onChanged: onChanged,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        prefixIcon: Icon(iconData),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Colors.grey.shade50,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
      ),
      // obscureText: true,
      validator:
          validator ??
          (value) {
            if (value == null || value.isEmpty) {
              return 'This field is required';
            }

            if (labelText.toLowerCase().contains('email') &&
                !value.contains('@')) {
              return 'Please enter a valid email';
            }

            if (labelText.toLowerCase().contains('password') &&
                value.length < 6) {
              return 'Password must be at least 6 characters';
            }

            return null;
          },
    );
  }
}
