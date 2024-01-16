import 'package:flutter/material.dart';
import 'package:luhouyang_portfolio/utilities/ui_colour.dart';

class TitleTextWidget extends StatelessWidget {
  final String title;

  const TitleTextWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(title, style: TextStyle(
      fontSize: 36,
      color: MyColors().textAndContainer,
      fontWeight: FontWeight.bold
    ),);
  }
}
