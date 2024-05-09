import 'package:basic_widgets/config/theme/app_theme.dart';
import 'package:basic_widgets/presentation/screens/buttons/buttons_screen.dart';
import 'package:basic_widgets/presentation/screens/cards/cards_screen.dart';
import 'package:basic_widgets/presentation/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      theme: AppTheme(selectedColorIndex: 6).getTheme(),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
      routes: {
        '/home': (context) => const HomeScreen(),
        '/buttons': (context) => const ButtonsScreen(),
        '/cards': (context) => const CardsScreen(),
      },
    );
  }
}
