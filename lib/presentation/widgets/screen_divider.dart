import 'package:flutter/material.dart';

class AppScreenDivider extends StatelessWidget {
  final String text;
  const AppScreenDivider({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          const Expanded(
            child: Divider(
              color: Colors.grey,
              thickness: 1,
              indent: 16.0,
              endIndent: 8.0,
            ),
          ),
          Text(
            text,
            style: const TextStyle(color: Colors.grey),
          ),
          const Expanded(
            child: Divider(
              color: Colors.grey,
              thickness: 1,
              indent: 8.0,
              endIndent: 16.0,
            ),
          ),
        ],
      ),
    );
  }
}
