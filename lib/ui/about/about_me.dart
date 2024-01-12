import 'package:flutter/material.dart';
import 'package:luhouyang_portfolio/ui/widgets/testing/content_testing.dart';

class AboutMe extends StatefulWidget {
  const AboutMe({super.key});

  @override
  State<AboutMe> createState() => _AboutMeState();
}

class _AboutMeState extends State<AboutMe> {
  @override
  Widget build(BuildContext context) {
    return ContentTesting();
  }
}
