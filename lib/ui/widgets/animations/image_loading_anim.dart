import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

class ImageLoadingAnim extends StatefulWidget {
  const ImageLoadingAnim({Key? key}) : super(key: key);

  @override
  ImageLoadingAnimState createState() =>
      ImageLoadingAnimState();
}

class ImageLoadingAnimState extends State {
  // set colours
  final List _colors = [
    const Color.fromARGB(255, 211, 214, 255),
    const Color.fromARGB(255, 180, 180, 255),
    const Color.fromARGB(255, 140, 140, 255),
    const Color.fromARGB(255, 100, 100, 255),
  ];

  // track colour
  int _currentColorIndex = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  // Start the timer
  void _startTimer() {
    _timer = Timer.periodic(const Duration(milliseconds: 500), (timer) {
      setState(() {
        _currentColorIndex = (_currentColorIndex + 1) % _colors.length;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: MediaQuery.of(context).size.width*0.45,
      duration: const Duration(milliseconds: 1000),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        gradient: LinearGradient(
          colors: [
            _colors[_currentColorIndex], // Use the current color
            _colors[(_currentColorIndex + 1) %
                _colors.length], // Use the next color in the list
          ],
          transform:
              GradientRotation(Random().nextDouble()), // add position variation
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
    );
  }
}
