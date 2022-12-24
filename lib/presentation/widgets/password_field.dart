import 'package:flutter/material.dart';
import 'package:sim/buisness_logic/validators.dart';
import 'package:sim/core/extensions.dart';

import 'input_field.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({super.key});

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return MyTextField(
      obscureText: _obscureText,
      validator: MyValidators.validatePassword(),
      prefixIcon: const Icon(Icons.lock_outlined),
      hint: '********',
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
