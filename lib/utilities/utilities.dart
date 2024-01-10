import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:luhouyang_portfolio/utilities/ui_colour.dart';
import 'package:url_launcher/url_launcher.dart';

enum ScreenType { mobile, tab, web }

class Utilities {
  static BuildContext? lastContext;

  /* URL */
  static final resumeDownloadURL =
      '''https://jeeva-portfolio.s3.amazonaws.com/JEEVANANDHAM's+Resume.pdf''';

  getMqWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  getMqHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  showSnackBar(String msg, {BuildContext? context}) {
    ScaffoldMessenger.of(context ?? lastContext!)
        .showSnackBar(SnackBar(content: Text(msg)));
  }

  ScreenType getScreenType(BuildContext context) {
    double scrWidth = getMqWidth(context);
    if (scrWidth > 915) {
      return ScreenType.web;
    } else if (scrWidth < 650) {
      return ScreenType.mobile;
    }
    return ScreenType.tab;
  }

  downloadResume(context) async {
    await launchUrl(Uri.parse(Utilities.resumeDownloadURL));
  }

  alertDialog(context, title, msg) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
                title: Text(title),
                content: Text(msg),
                actions: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(foregroundColor: MyColors().neonColor),
                      onPressed: () => Navigator.pop(context),
                      child: Text('Okay'))
                ]));
  }

  Future<bool> sendEmail(name, contact, msg) async {
    var url = Uri.https('hbk-portfolio-mailer.web.app', '/sendMail');
    var response = await post(url, body: {
      "name": name,
      "contactInfo": contact,
      "message": msg
    }).timeout(Duration(seconds: 10)).onError((error, stackTrace) {
      return Response("body", 400);
    });
    print(response.body);
    return response.statusCode == 200;
  }
}