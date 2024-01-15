import 'package:flutter/material.dart';
import 'package:luhouyang_portfolio/ui/widgets/general/title_text_widget.dart';
import 'package:luhouyang_portfolio/utilities/ui_colour.dart';

class Projects extends StatefulWidget {
  const Projects({super.key});

  @override
  State<Projects> createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: MyColors().textAndContainer,
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
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 1),
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: MyColors().textBoxColor,
                        borderRadius: BorderRadius.circular(8.0)),
                    height: 100,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: MyColors().textBoxColor,
                        borderRadius: BorderRadius.circular(8.0)),
                    height: 100,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: MyColors().textBoxColor,
                        borderRadius: BorderRadius.circular(8.0)),
                    height: 100,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: MyColors().textBoxColor,
                        borderRadius: BorderRadius.circular(8.0)),
                    height: 100,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: MyColors().textBoxColor,
                        borderRadius: BorderRadius.circular(8.0)),
                    height: 100,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: MyColors().textBoxColor,
                        borderRadius: BorderRadius.circular(8.0)),
                    height: 100,
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
