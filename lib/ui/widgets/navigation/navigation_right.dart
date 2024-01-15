import 'package:flutter/material.dart';
import 'package:luhouyang_portfolio/utilities/ui_colour.dart';

class NavigationRightBar extends StatefulWidget {
  const NavigationRightBar({super.key});

  @override
  State<NavigationRightBar> createState() => _NavigationRightBarState();
}

class _NavigationRightBarState extends State<NavigationRightBar> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 1,
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                  flex: 4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 25),
                        child: RotatedBox(
                            quarterTurns: 1,
                            child: Text(
                              'luhouyang@gmail.com',
                              style: TextStyle(
                                letterSpacing: 1,
                                color: MyColors().textAndContainer,
                                fontSize: 14,
                                //fontFamily: 'sfmono',
                              ),
                            )),
                      )
                    ],
                  )),
              Expanded(
                  child: Container(
                width: 1,
                color: Colors.white,
              ))
            ],
          ),
        ));
  }
}
