import 'package:flutter/material.dart';

final colorList = <Color>[
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.red,
  Colors.purple,
  Colors.deepPurple,
  Colors.orange,
  Colors.pink,
  Colors.pinkAccent,
];

class AppTheme {
  final int selectedColor;
  final bool isDrakmode;

  AppTheme({this.isDrakmode = false, this.selectedColor = 0})
    : assert(selectedColor >= 0, 'Selected color must be greater theme 0'),
      assert(
        selectedColor < colorList.length,
        'Selected color must be less or equal theme ${colorList.length - 1}',
      );

  ThemeData getTheme() => ThemeData(
    useMaterial3: true,
    brightness: isDrakmode? Brightness.dark : Brightness.light,
    colorSchemeSeed: colorList[selectedColor],
    appBarTheme: const AppBarTheme(centerTitle: false),
  );
}
