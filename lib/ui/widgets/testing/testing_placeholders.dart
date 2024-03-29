import 'package:flutter/material.dart';
import 'package:luhouyang_portfolio/utilities/ui_colour.dart';

class TestingPlaceholders {
  final String contentPlaceholder =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";

  final Widget certBadge = Container(
    child: Tooltip(
      message: "Creditation",
      preferBelow: true,
      verticalOffset: 75,
        child: Image.asset("assets/pics/SD_Blue.png"),
    ));

    final Widget testingContainer = Container(
      height: 1000,
      decoration: BoxDecoration(color: MyColors().textAndContainer),
      child: const Center(child: Text("placeholder")),
    );
}
