import 'package:flutter/material.dart';
import 'package:luhouyang_portfolio/ui/widgets/testing/testing_placeholders.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class Stories extends StatefulWidget {
  // variable to ensure widget is in view
  final int index;
  final AutoScrollController scrollController;
  final Function getPosition; // check if widget is rendered after button press
  
  const Stories({super.key, required this.index, required this.scrollController, required this.getPosition});

  @override
  State<Stories> createState() => _StoriesState();
}

class _StoriesState extends State<Stories> {
  @override
  Widget build(BuildContext context) {
    return TestingPlaceholders().testingContainer;
  }
}