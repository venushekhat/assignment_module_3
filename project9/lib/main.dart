import 'package:flutter/material.dart';
import 'package:project9/clickradiobuttonchangescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Color Selector',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ColorSelectorScreen(),
    );
  }
}
