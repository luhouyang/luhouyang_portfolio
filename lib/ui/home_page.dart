import 'package:flutter/material.dart';
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

  late AutoScrollController controller;
  late List<List<int>> randomList;

  @override
  void initState() {
    controller = AutoScrollController(
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
            body: Container(
      decoration: BoxDecoration(
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
          Container(
              height: 70,
              padding: EdgeInsets.fromLTRB(20, 20, 15, 0),
              child: () {
                ScreenType screenType = Utilities().getScreenType(context);
                if (screenType == ScreenType.mobile ||
                    screenType == ScreenType.tab) {
                  return Row(
                    children: [
                      Expanded(child: Icon(Icons.sailing)),
                      Expanded(
                          flex: 9,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              PopupMenuButton(
                                color: MyColors().primaryColor,
                                itemBuilder: (c) => <PopupMenuEntry>[
                                  PopupMenuItem(
                                    child: Container(
                                        width: 90.0,
                                        child: InkWell(
                                          onTap: () =>
                                              debugPrint("selection 1"),
                                          child: Row(
                                            children: [
                                              Icon(Icons.account_circle_rounded,
                                                  size: 18),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10.0),
                                                child: Text(
                                                  'About',
                                                ),
                                              ),
                                            ],
                                          ),
                                        )),
                                  ),
                                  PopupMenuItem(
                                    child: InkWell(
                                      onTap: () => debugPrint("selection 2"),
                                      child: Row(
                                        children: [
                                          Icon(Icons.travel_explore_rounded,
                                              size: 18),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10.0),
                                            child: Text(
                                              'Experience',
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  PopupMenuItem(
                                    child: InkWell(
                                      onTap: () => debugPrint("selection 3"),
                                      child: Row(
                                        children: [
                                          Icon(Icons.computer_rounded,
                                              size: 18),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10.0),
                                            child: Text(
                                              'Work',
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  PopupMenuItem(
                                    child: InkWell(
                                      onTap: () => debugPrint("selection 4"),
                                      child: Row(
                                        children: [
                                          Icon(Icons.phone_rounded, size: 18),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10.0),
                                            child: Text(
                                              'Contact',
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                                child: Icon(Icons.menu_rounded, size: 25),
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
                      child: Icon(Icons.shield_sharp),
                    )),
                    Expanded(
                      flex: 9,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {
                              debugPrint("selection 1");
                            },
                            onHover: (bol) {
                              
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right: 30.0),
                              child: Row(
                                children: [
                                  Text("01. ",
                                      style: TextStyle(
                                          color: MyColors().neonColor,
                                          fontSize: 13,)),
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              debugPrint("selection 2");
                            },
                            onHover: (bol) {
                              
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right: 30.0),
                              child: Row(
                                children: [
                                  Text("02. ",
                                      style: TextStyle(
                                          color: MyColors().neonColor,
                                          fontSize: 13,)),
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              debugPrint("selection 3");
                            },
                            onHover: (bol) {
                              
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right: 30.0),
                              child: Row(
                                children: [
                                  Text("03. ",
                                      style: TextStyle(
                                          color: MyColors().neonColor,
                                          fontSize: 13,)),
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              debugPrint("selection 4");
                            },
                            onHover: (bol) {
                              
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right: 30.0),
                              child: Row(
                                children: [
                                  Text("04. ",
                                      style: TextStyle(
                                          color: MyColors().neonColor,
                                          fontSize: 13,)),
                                ],
                              ),
                            ),
                          ),
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
                                      BorderRadius.all(Radius.circular(3.0)),
                                  border: Border.all(
                                      color: MyColors().neonColor,
                                      width: 1.5)),
                              child: Center(
                                child: Text('Resume',
                                    style: TextStyle(
                                        color: MyColors().neonColor,
                                        fontSize: 13,
                                        letterSpacing: 1,
                                        fontWeight: FontWeight.bold,)),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                );
              }())
        ],
      ),
    )));
  }
}
