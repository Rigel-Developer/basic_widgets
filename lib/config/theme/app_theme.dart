import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.red,
  Colors.green,
  Colors.blue,
  Colors.yellow,
  Colors.orange,
  Colors.purple,
  Colors.pink,
  Colors.teal,
  Colors.cyan,
  Colors.indigo,
];

class AppTheme {
  final int selectedColorIndex;
  final bool isDark;
  AppTheme({this.isDark = false, this.selectedColorIndex = 0})
      : assert(selectedColorIndex >= 0,
            'selectedColorIndex should be greater than 0'),
        assert(selectedColorIndex < colorList.length,
            'selectedColorIndex should be less or equal than ${colorList.length - 1}');

  ThemeData getTheme() => ThemeData(
        useMaterial3: true,
        brightness: isDark ? Brightness.dark : Brightness.light,
        colorSchemeSeed: colorList[selectedColorIndex],
        appBarTheme: const AppBarTheme(
          centerTitle: false,
        ),
      );
}
