import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:luhouyang_portfolio/ui/about/about_me.dart';
import 'package:luhouyang_portfolio/ui/contacts/contacts.dart';
import 'package:luhouyang_portfolio/ui/projects/projects.dart';
import 'package:luhouyang_portfolio/ui/stories/stories.dart';
import 'package:luhouyang_portfolio/ui/widgets/navigation/navigation_left.dart';
import 'package:luhouyang_portfolio/ui/widgets/navigation/navigation_right.dart';
import 'package:luhouyang_portfolio/ui/widgets/navigation/navigation_top_bar.dart';
import 'package:luhouyang_portfolio/utilities/utilities.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // top navigation bar
  bool _visible = true;

  // auto scrolling
  final scrollDirection = Axis.vertical;
  late AutoScrollController scrollController;

  // fade in
  late Size windowSize;
  int widgetNum = 4;
  final List<GlobalKey> _keys = [];
  List<bool> visibleBoolList = [];

  void getPosition() {
    // debugPrint("Window Size: ${windowSize.height}");
    for (int i = 0; i < widgetNum; i++) {
      RenderObject? renderObject = _keys[i].currentContext?.findRenderObject();
      if (renderObject != null) {
        visibleBoolList[i] = true;
        // RenderBox box = renderObject as RenderBox;
        // Offset position =
        //     box.localToGlobal(Offset.zero); //this is global position
        // double y = position.dy; //this is y - I think it's what you want
        // double h = box.size.height;
        // debugPrint("key $i y position: $y   :::::    height: $h");
      } else {
        visibleBoolList[i] = false;
      }
    }
  }

  Widget _wrapScrollTag({required int index, required Widget child}) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 1100),
      opacity: visibleBoolList[index] ? 1 : 0,
      child: Container(
        key: _keys[index],
        margin: const EdgeInsets.only(bottom: 20),
        child: AutoScrollTag(
          key: ValueKey(index),
          controller: scrollController,
          index: index,
          highlightColor: Colors.black.withOpacity(0.1),
          child: child,
        ),
      ),
    );
  }

  @override
  void initState() {
    for (int i = 0; i < widgetNum; i++) {
      _keys.add(GlobalKey());
      visibleBoolList.add(true);
    }
    scrollController = AutoScrollController(
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
    windowSize = MediaQuery.of(context).size;

    return SafeArea(
        child: Scaffold(
            body: NotificationListener<UserScrollNotification>(
      onNotification: (notification) {
        final ScrollDirection scrollDirection = notification.direction;
        // final ScrollPosition scrollPosition = scrollController.position;
        getPosition();
        setState(() {
          if (scrollDirection == ScrollDirection.reverse) {
            _visible = false;
          } else if (scrollDirection == ScrollDirection.forward) {
            _visible = true;
          }
        });
        // debugPrint("Top scroll extent: ${scrollPosition.pixels}");
        // debugPrint("Bottom scroll extent: ${scrollPosition.pixels + windowSize.height}");
        // debugPrint(_visible.toString());
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
                child: NavigationTopBar(scrollController: scrollController)),
            /*
            TODO:
            ask for Coastalcare/TTS pictures
            sectioning (About, Projects (card view), Stories (expandables/point map), Contacts)
            */
            Expanded(
              child: () {
                ScreenType screenType = Utilities().getScreenType(context);
                return Row(
                  children: [
                    screenType == ScreenType.web
                        ? const NavigationLeftBar()
                        : const SizedBox(
                            width: 10,
                          ),
                    Expanded(
                        flex: 10,
                        child: ListView(
                          scrollDirection: scrollDirection,
                          controller: scrollController,
                          children: [
                            _wrapScrollTag(index: 0, child: const AboutMe()),
                            _wrapScrollTag(index: 1, child: const Projects()),
                            _wrapScrollTag(index: 2, child: const Stories()),
                            _wrapScrollTag(index: 3, child: const Contacts()),
                          ],
                        )),
                    screenType == ScreenType.web
                        ? const NavigationRightBar()
                        : const SizedBox(
                            width: 10,
                          ),
                  ],
                );
              }(),
            ),
          ],
        ),
      ),
    )));
  }
}
