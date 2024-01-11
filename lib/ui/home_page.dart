import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:luhouyang_portfolio/utilities/ui_colour.dart';
import 'package:luhouyang_portfolio/utilities/utilities.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scrollDirection = Axis.vertical;

  late AutoScrollController _scrollControler;
  late List<String> contentList = ["abc", "def", "abc", "def"];

  bool _visible = true;
  int _scrollIndex = 0;

  Future _scrollToCounter() async {
    await _scrollControler.scrollToIndex(_scrollIndex,
        preferPosition: AutoScrollPosition.begin);
    _scrollControler.highlight(_scrollIndex);
  }

  Widget _getRow(int index, String data, double height) {
    return _wrapScrollTag(
        index: index,
        child: Container(
          padding: const EdgeInsets.all(8),
          alignment: Alignment.topCenter,
          height: height,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.lightBlue, width: 4),
              borderRadius: BorderRadius.circular(12)),
          child: Text('index: $index, data: $data'),
        ));
  }

  Widget _wrapScrollTag({required int index, required Widget child}) =>
      AutoScrollTag(
        key: ValueKey(index),
        controller: _scrollControler,
        index: index,
        highlightColor: Colors.black.withOpacity(0.1),
        child: child,
      );

  PopupMenuEntry _popUpMenu(String text, Icon icon, int index) {
    return PopupMenuItem(
      child: Container(
          width: 100,
          child: InkWell(
            onTap: () {
              debugPrint(text);
              setState(() => _scrollIndex = index);
              _scrollToCounter();
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
        setState(() => _scrollIndex = index);
        _scrollToCounter();
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
  void initState() {
    _scrollControler = AutoScrollController(
        viewportBoundaryGetter: () =>
            Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
        axis: scrollDirection);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: NotificationListener<UserScrollNotification>(
      onNotification: (notification) {
        final ScrollDirection scrollDirection = notification.direction;
        setState(() {
          if (scrollDirection == ScrollDirection.reverse) {
            _visible = false;
          } else if (scrollDirection == ScrollDirection.forward) {
            _visible = true;
          }
        });
        debugPrint(_visible.toString());
        return true;
      },
      child: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
              Color.fromARGB(255, 61, 16, 134),
              Color.fromARGB(255, 40, 16, 110),
              Color.fromARGB(255, 20, 16, 80)
            ])),
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            AnimatedOpacity(
              duration: const Duration(milliseconds: 500),
              opacity: _visible ? 1 : 0,
              child: Column(
                children: [
                  Container(
                      height: 70,
                      padding: const EdgeInsets.fromLTRB(20, 20, 15, 0),
                      child: () {
                        ScreenType screenType =
                            Utilities().getScreenType(context);
                        if (screenType == ScreenType.mobile ||
                            screenType == ScreenType.tab) {
                          return Row(
                            children: [
                              const Expanded(child: Icon(Icons.sailing)),
                              Expanded(
                                  flex: 9,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      PopupMenuButton(
                                        color: MyColors().primaryColor,
                                        itemBuilder: (c) => <PopupMenuEntry>[
                                          _popUpMenu(
                                              "About",
                                              const Icon(
                                                  Icons.account_circle_rounded,
                                                  size: 18),
                                              0),
                                          _popUpMenu(
                                              "Experience",
                                              const Icon(
                                                  Icons.travel_explore_rounded,
                                                  size: 18),
                                              1),
                                          _popUpMenu(
                                              "Work",
                                              const Icon(Icons.computer_rounded,
                                                  size: 18),
                                              2),
                                          _popUpMenu(
                                              "Contact",
                                              const Icon(Icons.phone_rounded,
                                                  size: 18),
                                              3),
                                        ],
                                        child: const Icon(Icons.menu_rounded,
                                            size: 25),
                                      )
                                    ],
                                  ))
                            ],
                          );
                        }
                        return Row(
                          children: [
                            Expanded(
                                child: Container(
                              width: Utilities().getMqWidth(context) * 0.07,
                              height: Utilities().getMqHeight(context) * 0.07,
                              child: const Icon(Icons.sailing),
                            )),
                            Expanded(
                              flex: 9,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  _menuItem("About", 0),
                                  _menuItem("Experience", 1),
                                  _menuItem("Work", 2),
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
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(3.0)),
                                          border: Border.all(
                                              color: MyColors().neonColor,
                                              width: 1.5)),
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
                      }()),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: scrollDirection,
                controller: _scrollControler,
                itemCount: contentList.length,
                itemBuilder: (context, index) {
                  return Padding(
                      padding: const EdgeInsets.all(8),
                      child: _getRow(index, contentList[index], 500.0));
                },
              ),
            )
          ],
        ),
      ),
    )));
  }
}
