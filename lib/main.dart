import 'package:flutter/material.dart';
import 'package:mis_widgets_app/config/theme/app_theme.dart';
import 'package:mis_widgets_app/presentatio/screens/buttons/buttons_screen.dart';
import 'package:mis_widgets_app/presentatio/screens/cards/cards_screen.dart';
import 'package:mis_widgets_app/presentatio/screens/home/home_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme(selectedColor: 0).getTheme(),
      home: Scaffold(
        body: HomeScreen(),
      ),
      routes: {
      '/buttons': (contex)=> ButtonsScreen(),
      '/cards': (contex)=> CardsScreen(),
      }
    );
  }
}
