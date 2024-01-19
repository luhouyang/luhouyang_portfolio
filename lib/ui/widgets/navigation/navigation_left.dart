import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:luhouyang_portfolio/utilities/ui_colour.dart';
import 'package:luhouyang_portfolio/utilities/utilities.dart';
import 'package:url_launcher/url_launcher.dart';

class NavigationLeftBar extends StatefulWidget {
  const NavigationLeftBar({super.key});

  @override
  State<NavigationLeftBar> createState() => _NavigationLeftBarState();
}

class _NavigationLeftBarState extends State<NavigationLeftBar> {
  late Timer _timer;
  int _currentColorIndex = 0;

  String selectedIcon = "";

  void _startTimer() {
    _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      setState(() {
        _currentColorIndex =
            (_currentColorIndex + 1) % MyColors().gamingRGB.length;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  Widget _iconWidget(String url, String iconName, String svgAsset) {
    return Container(
      height: Utilities().getMQHeight(context) * 0.07,
      child: Tooltip(
        message: iconName == "git"
            ? "Github"
            : iconName == "insta"
                ? "Instagram"
                : iconName == "linkedIn"
                    ? "Linked In"
                    : iconName == "stackoverflow"
                        ? "Stackoverflow"
                        : iconName == "googleplay"
                        ? "Google Play"
                        : "",
        preferBelow: true,
        child: InkWell(
          onTap: () async {
            await launchUrl(Uri.parse(url));
          },
          onHover: (value) {
            setState(() {
              if (value) {
                selectedIcon = iconName;
              } else {
                selectedIcon = "";
              }
            });
          },
          child: Container(
            margin: EdgeInsets.only(bottom: selectedIcon == iconName ? 5.0 : 0),
            padding: const EdgeInsets.only(bottom: 8.0),
            child: SvgPicture.asset(svgAsset,
                colorFilter: selectedIcon == iconName
                    ? ColorFilter.mode(MyColors().gamingRGB[_currentColorIndex],
                        BlendMode.srcIn)
                    : ColorFilter.mode(
                        MyColors().textAndContainer, BlendMode.srcIn),
                width: 22),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 1,
        child: Column(
          children: [
            Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      _iconWidget("https://github.com/luhouyang", "git",
                          "assets/svg/github.svg"),
                      _iconWidget(
                          "https://www.instagram.com/luhouyang?igsh=ajdnMW95ODJsMG4x",
                          "insta",
                          "assets/svg/instagram.svg"),
                      _iconWidget(
                          "https://www.linkedin.com/in/lu-hou-yang-ab69192a9",
                          "linkedIn",
                          "assets/svg/linkedIn.svg"),
                      _iconWidget(
                          "https://stackoverflow.com/users/23238085/lu-hou-yang",
                          "stackoverflow",
                          "assets/svg/stackoverflow.svg"),
                    ],
                  ),
                )),
            Expanded(
                child: Container(
              width: 1,
              color: MyColors().textAndContainer,
            ))
          ],
        ));
  }
}
