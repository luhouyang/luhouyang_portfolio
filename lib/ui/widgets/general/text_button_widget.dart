import 'package:flutter/material.dart';

class TextButtonWidget extends StatelessWidget {
  final String title;
  final Color color;

  const TextButtonWidget({super.key, required this.title, required this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          fontSize: 13,
          color: color,
          fontWeight: FontWeight.bold),
    );
  }
}
