import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:luhouyang_portfolio/ui/widgets/general/project_text_widget.dart';
import 'package:luhouyang_portfolio/ui/widgets/general/text_button_widget.dart';
import 'package:luhouyang_portfolio/ui/widgets/general/title_text_widget.dart';
import 'package:luhouyang_portfolio/utilities/ui_colour.dart';
import 'package:luhouyang_portfolio/utilities/utilities.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:url_launcher/url_launcher.dart';

class Projects extends StatefulWidget {
  // variable to ensure widget is in view
  final int index;
  final AutoScrollController scrollController;
  final Function getPosition; // check if widget is rendered after button press

  const Projects(
      {super.key,
      required this.scrollController,
      required this.getPosition,
      required this.index});

  @override
  State<Projects> createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
  // onHover
  String selectedCard = "";
  bool backButton = false;

  // onTap
  bool clicked = false;
  String clickedName = "";
  String selectedIcon = "";

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
            padding: const EdgeInsets.all(5.0),
            child: SvgPicture.asset(svgAsset,
                colorFilter: selectedIcon == iconName
                    ? ColorFilter.mode(MyColors().neonLight, BlendMode.srcIn)
                    : ColorFilter.mode(
                        MyColors().textAndContainer, BlendMode.srcIn),
                width: 22),
          ),
        ),
      ),
    );
  }

  Widget _singleView() {
    return Container(
      width: Utilities().getMQWidth(context),
      decoration: BoxDecoration(
        color: MyColors().textBoxColor,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: Utilities().getMQWidth(context) * 0.05,
              ),
              ProjectTextWidget(title: clickedName),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    _iconWidget("https://github.com/luhouyang", "git",
                        "assets/svg/github.svg"),
                    _iconWidget(
                        "https://play.google.com/store/apps/details?id=com.lostandfound.lostfound&pcampaignid=web_share",
                        "googleplay",
                        "assets/svg/googleplay.svg"),
                    SizedBox(
                      width: Utilities().getMQWidth(context) * 0.03,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            height: 2,
            width: Utilities().getMQWidth(context) * 0.8,
            decoration: BoxDecoration(color: MyColors().borderColor),
          ),
          SizedBox(
            height: 400,
          ),
          Container(
            height: 2,
            width: Utilities().getMQWidth(context) * 0.8,
            decoration: BoxDecoration(color: MyColors().borderColor),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 15, 10),
                child: InkWell(
                    onTap: () {
                      setState(() {
                        clicked = false;
                        clickedName = "";
                      });
                      widget.scrollController
                          .scrollToIndex(widget.index,
                              preferPosition: AutoScrollPosition.begin)
                          .then((value) {
                        widget.getPosition();
                      });
                    },
                    onHover: (value) {
                      setState(() {
                        if (value) {
                          backButton = true;
                        } else {
                          backButton = false;
                        }
                      });
                    },
                    child: Row(
                      children: [
                        Icon(Icons.arrow_back_rounded,
                            color: backButton
                                ? MyColors().neonLight
                                : MyColors().textAndContainer),
                        TextButtonWidget(
                            title: "Back",
                            color: backButton
                                ? MyColors().neonLight
                                : MyColors().textAndContainer),
                      ],
                    )),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _projectTile(String name) {
    return InkWell(
      onHover: (value) {
        setState(() {
          if (value) {
            selectedCard = name;
          } else {
            selectedCard = "";
          }
        });
      },
      onTap: () {
        if (selectedCard == name) {
          setState(() {
            clicked = true;
            clickedName = name;
          });
          widget.scrollController
              .scrollToIndex(widget.index,
                  preferPosition: AutoScrollPosition.begin)
              .then((value) {
            widget.getPosition();
          });
        }
      },
      child: Container(
        margin: EdgeInsets.all(selectedCard == name ? 8.0 : 0),
        child: Card(
          color: MyColors().textBoxColor,
          elevation: 10,
          child: Container(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(
                      'assets/svg/folder.svg',
                      width: 45,
                      height: 45,
                      colorFilter: ColorFilter.mode(
                          MyColors().neonLight, BlendMode.srcIn),
                    ),
                    SvgPicture.asset(
                      'assets/svg/externalLink.svg',
                      width: 22,
                      height: 22,
                      colorFilter: selectedCard == name
                          ? ColorFilter.mode(
                              MyColors().neonLight, BlendMode.srcIn)
                          : ColorFilter.mode(
                              MyColors().textAndContainer, BlendMode.srcIn),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 8.0),
                  child: Row(
                    children: [
                      Text(
                        name,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: selectedCard == name
                                ? MyColors().neonLight
                                : Colors.white,
                            letterSpacing: 1,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                    child: Text(
                      name,
                      style: TextStyle(
                        color: MyColors().textAndContainer,
                        letterSpacing: 1,
                        height: 1.5,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Flutter" ?? "",
                      style: TextStyle(
                        color: MyColors().textAndContainer,
                        letterSpacing: 1,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      "Java" ?? "",
                      style: TextStyle(
                        color: MyColors().textAndContainer,
                        letterSpacing: 1,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      "HTML" ?? "",
                      style: TextStyle(
                        color: MyColors().textAndContainer,
                        letterSpacing: 1,
                        height: 1.5,
                        fontSize: 12,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            //color: MyColors().textAndContainer,
            borderRadius: BorderRadius.circular(8.0)),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 20),
                child: TitleTextWidget(title: "Projects"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: clicked
                  ? _singleView()
                  : GridView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                              childAspectRatio: 1),
                      children: [
                        _projectTile("first"),
                        _projectTile("second"),
                        _projectTile("third"),
                        _projectTile("fourth"),
                        _projectTile("fifth"),
                        _projectTile("sixth"),
                        _projectTile("seventh"),
                      ],
                    ),
            ),
          ],
        ));
  }
}
