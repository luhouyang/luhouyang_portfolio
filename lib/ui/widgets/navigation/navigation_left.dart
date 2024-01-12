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
  String val = "";

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 1,
        child: Column(
          children: [
            Expanded(
                flex: 4,
                child: Container(
                    child: Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: Utilities().getMQHeight(context) * 0.07,
                        child: InkWell(
                          onTap: () async {
                            await launchUrl(
                                Uri.parse("https://github.com/jeeva-HBK"));
                          },
                          onHover: (bol) {
                            setState(() {
                              if (bol) {
                                val = "git";
                              } else {
                                val = "";
                              }
                            });
                          },
                          child: Container(
                            margin:
                                EdgeInsets.only(bottom: val == "git" ? 5.0 : 0),
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: SvgPicture.asset('assets/svg/github.svg',
                                color: val == "git"
                                    ? MyColors().neonColor
                                    : MyColors().textColor,
                                width: 22),
                          ),
                        ),
                      ),
                      Container(
                        height: Utilities().getMQHeight(context) * 0.07,
                        child: InkWell(
                          onTap: () {},
                          onHover: (bol) {
                            setState(() {
                              if (bol) {
                                val = "insta";
                              } else {
                                val = "";
                              }
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.only(
                                bottom: val == "insta" ? 5.0 : 0),
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: SvgPicture.asset('assets/svg/instagram.svg',
                                color: val == "insta"
                                    ? MyColors().neonColor
                                    : MyColors().textColor,
                                width: 22),
                          ),
                        ),
                      ),
                      Container(
                        height: Utilities().getMQHeight(context) * 0.07,
                        child: InkWell(
                          onTap: () async {
                            await launchUrl(Uri.parse(
                                "https://www.linkedin.com/in/jeeva-hbk/"));
                          },
                          onHover: (bol) {
                            setState(() {
                              if (bol) {
                                val = "linkedIn";
                              } else {
                                val = "";
                              }
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.only(
                                bottom: val == "linkedIn" ? 5.0 : 0),
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: SvgPicture.asset('assets/svg/linkedIn.svg',
                                color: val == "linkedIn"
                                    ? MyColors().neonColor
                                    : MyColors().textColor,
                                width: 22),
                          ),
                        ),
                      ),
                      Container(
                        height: Utilities().getMQHeight(context) * 0.07,
                        child: InkWell(
                          onTap: () {},
                          onHover: (bol) {
                            setState(() {
                              if (bol) {
                                val = "twitter";
                              } else {
                                val = "";
                              }
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.only(
                                bottom: val == "twitter" ? 5.0 : 0),
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: SvgPicture.asset('assets/svg/twitter.svg',
                                color: val == "twitter"
                                    ? MyColors().neonColor
                                    : MyColors().textColor,
                                width: 22),
                          ),
                        ),
                      ),
                      Container(
                        height: Utilities().getMQHeight(context) * 0.07,
                        child: InkWell(
                          onTap: () async {
                            await launchUrl(Uri.parse(
                                "https://stackoverflow.com/users/19705360/mr-jeeva"));
                          },
                          onHover: (bol) {
                            setState(() {
                              if (bol) {
                                val = "stackoverflow";
                              } else {
                                val = "";
                              }
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.only(
                                bottom: val == "stackoverflow" ? 5.0 : 0),
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: SvgPicture.asset(
                                'assets/svg/stackoverflow.svg',
                                color: val == "stackoverflow"
                                    ? MyColors().neonColor
                                    : MyColors().textColor,
                                width: 22),
                          ),
                        ),
                      ),
                    ],
                  ),
                ))),
            Expanded(
                child: Container(
              width: 1,
              color: MyColors().textColor,
            ))
          ],
        ));
  }
}
