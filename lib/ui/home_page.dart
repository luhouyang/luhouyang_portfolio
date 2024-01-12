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
  final scrollDirection = Axis.vertical;
  final List<String> contentList = ["abc", "def", "abc", "def"];

  late AutoScrollController scrollController;

  bool _visible = true;
  List<bool> visibleSection = [true, false, false, false];
/*
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
*/
  Widget _wrapScrollTag({required int index, required Widget child}) =>
      AutoScrollTag(
        key: ValueKey(index),
        controller: scrollController,
        index: index,
        highlightColor: Colors.black.withOpacity(0.1),
        child: child,
      );

  @override
  void initState() {
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
                child: NavigationTopBar(scrollController: scrollController)),
            /*
            TODO:
            ask for Coastalcare/TTS pictures
            sectioning (About, Projects (card view), Stories (expandables/point map), Contacts)
            add shimmer
            add image loading
            use bool list for sequential loading? (add override if skipped)
            */
            Expanded(
              child: () {
                ScreenType screenType = Utilities().getScreenType(context);
                return Row(
                  children: [
                    screenType == ScreenType.web
                        ? const NavigationLeftBar()
                        : const SizedBox(),
                    Expanded(
                        //  if loading show shimmer for each section
                        flex: 10,
                        child: ListView(
                          scrollDirection: scrollDirection,
                          controller: scrollController,
                          children: [
                            _wrapScrollTag(index: 0, child: const AboutMe()),
                            const SizedBox(
                              height: 20,
                            ),
                            _wrapScrollTag(index: 1, child: const Projects()),
                            const SizedBox(
                              height: 20,
                            ),
                            _wrapScrollTag(index: 2, child: const Stories()),
                            const SizedBox(
                              height: 20,
                            ),
                            _wrapScrollTag(index: 3, child: const Contacts()),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        )
                        /*ListView.builder(
                        scrollDirection: scrollDirection,
                        controller: scrollController,
                        itemCount: contentList.length,
                        itemBuilder: (context, index) {
                          return Padding(
                              padding: const EdgeInsets.all(8),
                              child: _getRow(index, contentList[index], 500.0));
                        },
                      ),*/
                        ),
                    screenType == ScreenType.web
                        ? const NavigationRightBar()
                        : const SizedBox(),
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
