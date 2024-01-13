import 'package:flutter/material.dart';
import 'package:luhouyang_portfolio/ui/widgets/general/title_text_widget.dart';
import 'package:luhouyang_portfolio/utilities/ui_colour.dart';
import 'package:luhouyang_portfolio/utilities/utilities.dart';

class AboutMe extends StatefulWidget {
  const AboutMe({super.key});

  @override
  State<AboutMe> createState() => _AboutMeState();
}

class _AboutMeState extends State<AboutMe> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: MyColors().textAndContainer,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 20),
              child: TitleTextWidget(title: "About"),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  children: [
                    Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                              color: MyColors().borderColor,
                              borderRadius: BorderRadius.circular(8.0)),
                          width: Utilities().getMQWidth(context) * 0.4 - 10,
                          height: 390,
                        ),
                      ],
                    ),
                    Positioned(
                        bottom: 10,
                        left: 10,
                        child: Container(
                          width: Utilities().getMQWidth(context) * 0.4 - 10,
                          height: 390,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              color: MyColors().textBoxColor),
                        ))
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
