import 'package:fingers/pages/about_page.dart';
import 'package:fingers/pages/game_page.dart';
import 'package:fingers/pages/home_page.dart';
import 'package:fingers/pages/settings_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/home',
      routes: {
        '/home': (context) => HomePage(),
        '/game': (context) => GamePage(),
        '/settings': (context) => SettingsPage(),
        '/about': (context) => AboutPage(),
      },
    );
  }
}
