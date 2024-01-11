// packages
import 'package:flutter/material.dart';

// firebase
import 'package:firebase_core/firebase_core.dart';
import 'package:luhouyang_portfolio/utilities/ui_colour.dart';
import 'firebase_options.dart';

// files
import 'package:luhouyang_portfolio/ui/home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Lu Hou Yang Portfolio",
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: MyColors().primaryColor,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
