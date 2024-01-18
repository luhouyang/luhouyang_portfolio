import 'package:flutter/material.dart';
import 'package:luhouyang_portfolio/ui/widgets/general/title_text_widget.dart';
import 'package:luhouyang_portfolio/ui/widgets/testing/testing_placeholders.dart';

class Certificates extends StatefulWidget {
  const Certificates({super.key});

  @override
  State<Certificates> createState() => _CertificatesState();
}

class _CertificatesState extends State<Certificates> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        //color: MyColors().textAndContainer,
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
              child: TitleTextWidget(title: "Certificates"),
            ),
          ),
          GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
              crossAxisSpacing: 25,
              mainAxisSpacing: 25,
              childAspectRatio: 1
              ),
              shrinkWrap: true,
            children: [
              TestingPlaceholders().certBadge,
              TestingPlaceholders().certBadge,
              TestingPlaceholders().certBadge,
              TestingPlaceholders().certBadge,
              TestingPlaceholders().certBadge,
              TestingPlaceholders().certBadge,
            ],),
        ],
      ),
    );
  }
}
