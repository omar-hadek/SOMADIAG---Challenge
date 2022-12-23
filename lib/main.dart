import 'package:flutter/material.dart';

import 'package:somadiac_challenge/src/ui/screens/character_selector/character_selector_screen.dart';

void main() {
  runApp(
    const MyApp(), // Wrap your app
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Somadiac challenge',
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
        backgroundColor: Colors.green,
      )),
      home: const CharacterSelectorScreen(),
    );
  }
}
