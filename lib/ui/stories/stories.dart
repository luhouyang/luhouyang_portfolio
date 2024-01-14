import 'package:flutter/material.dart';
import 'package:luhouyang_portfolio/ui/widgets/testing/content_testing.dart';

class Stories extends StatefulWidget {
  const Stories({super.key});

  @override
  State<Stories> createState() => _StoriesState();
}

class _StoriesState extends State<Stories> {
  @override
  Widget build(BuildContext context) {
    return const ContentTesting();
  }
}