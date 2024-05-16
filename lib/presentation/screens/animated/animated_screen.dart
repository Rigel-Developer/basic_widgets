import 'dart:math' show Random;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AnimatedScreen extends StatefulWidget {
  static const String name = 'animated_screen';

  const AnimatedScreen({super.key});

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {
  double width = 100;
  double height = 100;
  Color color = Colors.green;
  double borderRadius = 10.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Animated Container'),
        ),
        body: Center(
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: width <= 0 ? 1 : width,
            height: height <= 0 ? 1 : height,
            curve: Curves.bounceOut,
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(borderRadius <= 0 ? 1 : borderRadius),
              color: color,
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Random width and height
            final random = Random();
            width = random.nextInt(300) + 120;
            height = random.nextInt(300) + 120;
            color = Color.fromRGBO(
              random.nextInt(256),
              random.nextInt(256),
              random.nextInt(256),
              1,
            );
            borderRadius = random.nextInt(100) + 20;

            setState(() {});
          },
          tooltip: 'Animate',
          child: const Icon(Icons.play_arrow),
        ));
  }
}
