import 'package:flutter/material.dart';
import 'package:luhouyang_portfolio/ui/widgets/testing/content_testing.dart';

class Contacts extends StatefulWidget {
  const Contacts({super.key});

  @override
  State<Contacts> createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  @override
  Widget build(BuildContext context) {
    return ContentTesting();
  }
}