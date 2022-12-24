import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String hint;
  final bool obscureText;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final int? maxLength;

  const MyTextField({
    super.key,
    this.prefixIcon,
    required this.hint,
    this.suffixIcon,
    this.obscureText = false,
    this.validator,
    this.keyboardType,
    this.maxLength,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      keyboardType: keyboardType,
      maxLength: maxLength,
      obscureText: obscureText,
      decoration: InputDecoration(
        // prefixIcon: prefixIcon,
        icon: prefixIcon,
        hintText: hint,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
