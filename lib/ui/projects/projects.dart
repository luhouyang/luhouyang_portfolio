import 'package:flutter/material.dart';
import 'package:luhouyang_portfolio/ui/widgets/general/title_text_widget.dart';
import 'package:luhouyang_portfolio/utilities/ui_colour.dart';

class Projects extends StatefulWidget {
  const Projects({super.key});

  @override
  State<Projects> createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
  String selected = "";

  Widget _testing(String name) {
    return InkWell(
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
        margin: EdgeInsets.only(bottom: selected == name ? 5.0 : 0),
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Container(
          decoration: BoxDecoration(
              color: MyColors().textBoxColor,
              borderRadius: BorderRadius.circular(8.0)),
          child: const Text("stuff"),
        ),
      ),
    );
  }

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
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 1),
                children: [
                  _testing("first"),
                  _testing("second"),
                  _testing("third"),
                  _testing("fourth"),
                  _testing("fifth"),
                  _testing("sixth"),
                ],
              ),
            ),
          ],
        ));
  }
}
