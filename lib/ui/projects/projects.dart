import 'package:flutter/material.dart';
import 'package:luhouyang_portfolio/ui/widgets/testing/content_testing.dart';

class Projects extends StatefulWidget {
  const Projects({super.key});

  @override
  State<Projects> createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
  @override
  Widget build(BuildContext context) {
    return const ContentTesting();
  }
}
