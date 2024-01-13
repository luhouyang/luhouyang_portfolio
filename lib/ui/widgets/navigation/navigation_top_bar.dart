import 'package:flutter/material.dart';
import 'package:luhouyang_portfolio/utilities/ui_colour.dart';
import 'package:luhouyang_portfolio/utilities/utilities.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class NavigationTopBar extends StatefulWidget {
  final AutoScrollController scrollController;

  const NavigationTopBar({super.key, required this.scrollController});

  @override
  State<NavigationTopBar> createState() => _NavigationTopBarState();
}

class _NavigationTopBarState extends State<NavigationTopBar> {
  PopupMenuEntry _popUpMenu(String text, Icon icon, int index) {
    return PopupMenuItem(
      child: Container(
          width: 100,
          child: InkWell(
            onTap: () {
              debugPrint(text);
              widget.scrollController.scrollToIndex(index,
                  preferPosition: AutoScrollPosition.begin);
            },
            child: Row(
              children: [
                icon,
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(text),
                ),
              ],
            ),
          )),
    );
  }

  InkWell _menuItem(String text, int index) {
    return InkWell(
      onTap: () {
        debugPrint(text);
        widget.scrollController
            .scrollToIndex(index, preferPosition: AutoScrollPosition.begin);
      },
      onHover: (bol) {},
      child: Padding(
        padding: const EdgeInsets.only(right: 30.0),
        child: Row(
          children: [
            Text(
              text,
              style: TextStyle(
                color: MyColors().neonColor,
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 70,
        padding: const EdgeInsets.fromLTRB(0, 10, 15, 10),
        child: () {
          ScreenType screenType = Utilities().getScreenType(context);
          if (screenType == ScreenType.mobile || screenType == ScreenType.tab) {
            return Row(
              children: [
                const Expanded(child: Icon(Icons.sailing)),
                Expanded(
                    flex: 9,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        PopupMenuButton(
                          color: MyColors().borderColor,
                          itemBuilder: (c) => <PopupMenuEntry>[
                            _popUpMenu(
                                "About",
                                const Icon(Icons.account_circle_rounded,
                                    size: 18),
                                0),
                            _popUpMenu(
                                "Projects",
                                const Icon(Icons.travel_explore_rounded,
                                    size: 18),
                                1),
                            _popUpMenu(
                                "Stories",
                                const Icon(Icons.computer_rounded, size: 18),
                                2),
                            _popUpMenu("Contact",
                                const Icon(Icons.phone_rounded, size: 18), 3),
                          ],
                          child: const Icon(Icons.menu_rounded, size: 25),
                        )
                      ],
                    ))
              ],
            );
          }
          return Row(
            children: [
              const Expanded(
                child: Icon(Icons.sailing),
              ),
              Expanded(
                flex: 9,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    _menuItem("About", 0),
                    _menuItem("Projects", 1),
                    _menuItem("Stories", 2),
                    _menuItem("Contact", 3),
                    InkWell(
                      onTap: () {
                        Utilities().downloadResume(context);
                      },
                      child: Container(
                        height: 40,
                        width: 80,
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(3.0)),
                            border: Border.all(
                                color: MyColors().neonColor, width: 1.5)),
                        child: Center(
                          child: Text(
                            'Resume',
                            style: TextStyle(
                              color: MyColors().neonColor,
                              fontSize: 13,
                              letterSpacing: 1,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }());
  }
}
