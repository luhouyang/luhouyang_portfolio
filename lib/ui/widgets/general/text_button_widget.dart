import 'package:flutter/material.dart';
import 'package:luhouyang_portfolio/utilities/ui_colour.dart';

class TextButtonWidget extends StatelessWidget {
  final String title;

  const TextButtonWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(title, style: TextStyle(
      fontSize: 13,
      color: MyColors().neonLight,
      fontWeight: FontWeight.bold
    ),);
  }
}
