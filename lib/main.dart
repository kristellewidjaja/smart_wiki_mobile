import 'package:flutter/material.dart';
import 'main_page.dart';

var lightColorScheme = ColorScheme.fromSeed(
  seedColor: Color.fromARGB(255, 255, 255, 255),
);

// var darkColorScheme = ColorScheme.fromSeed(
//   seedColor: const Color.fromARGB(255, 128, 143, 243),
// );

void main() {
  runApp(const SmartWikiApp());
}

// Create a class with MaterialApp

class SmartWikiApp extends StatelessWidget {
  const SmartWikiApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: lightColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: lightColorScheme.onPrimaryContainer,
          foregroundColor: lightColorScheme.primary,
        ),
      ),
      // scaffold with text in center body
      title: 'SmartWiki',
      // theme: ThemeData(primarySwatch: Colors.deepPurple),
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}
