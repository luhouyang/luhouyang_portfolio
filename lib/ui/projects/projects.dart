import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:luhouyang_portfolio/ui/widgets/general/title_text_widget.dart';
import 'package:luhouyang_portfolio/utilities/ui_colour.dart';

class Projects extends StatefulWidget {
  const Projects({super.key});

  @override
  State<Projects> createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
  String selected = "";

  Widget _projectTile(String name) {
    return InkWell(
      onTap: () {},
      onHover: (value) {
        setState(() {
          if (value) {
            selected = name;
          } else {
            selected = "";
          }
        });
      },
      child: Container(
        margin: EdgeInsets.all(selected == name ? 8.0 : 0),
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
                      colorFilter: selected == name
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
                            color: selected == name
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
              child: GridView(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
                ],
              ),
            ),
          ],
        ));
  }
}
