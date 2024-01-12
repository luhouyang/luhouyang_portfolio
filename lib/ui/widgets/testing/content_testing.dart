import 'package:flutter/material.dart';
import 'package:luhouyang_portfolio/utilities/ui_colour.dart';

class ContentTesting extends StatelessWidget {
  const ContentTesting({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      decoration: BoxDecoration(
        color: MyColors().textColor
      ),
      child: const Center(child: Text("testing")),
    );
  }
}