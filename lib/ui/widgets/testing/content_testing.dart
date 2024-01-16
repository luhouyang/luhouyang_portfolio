import 'package:flutter/material.dart';
import 'package:luhouyang_portfolio/utilities/ui_colour.dart';

class ContentTesting extends StatelessWidget {
  const ContentTesting({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1000,
      decoration: BoxDecoration(color: MyColors().textAndContainer),
      child: const Center(child: Text("placeholder")),
    );
  }
}
