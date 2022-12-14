import 'package:flutter/material.dart';

class MyScreenDivider extends StatelessWidget {
  final String text;
  const MyScreenDivider({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: Colors.white,
            thickness: 1,
            indent: 16.0,
            endIndent: 8.0,
          ),
        ),
        Text(text),
        Expanded(
          child: Divider(
            color: Colors.white,
            thickness: 1,
            indent: 8.0,
            endIndent: 16.0,
          ),
        ),
      ],
    );
  }
}
