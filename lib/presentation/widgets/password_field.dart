import 'package:flutter/material.dart';
import 'package:sim/core/validators.dart';
import 'package:sim/core/extensions.dart';

import 'input_field.dart';

class AppPasswordField extends StatefulWidget {
  const AppPasswordField({this.hint, super.key});
  final String? hint;

  @override
  State<AppPasswordField> createState() => _AppPasswordFieldState();
}

class _AppPasswordFieldState extends State<AppPasswordField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return MyTextField(
      obscureText: _obscureText,
      validator: AppValidators.validatePassword(),
      prefixIcon: const Icon(Icons.lock),
      hint: widget.hint ?? 'Password',
      suffixIcon: InkWell(
        onTap: () {
          setState(
            () {
              _obscureText = _obscureText.revert();
            },
          );
        },
        child: Icon(
          _obscureText
              ? Icons.remove_red_eye_rounded
              : Icons.remove_red_eye_outlined,
        ),
      ),
    );
  }
}
