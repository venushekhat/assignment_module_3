import 'package:flutter/material.dart';
import 'package:project6/Fontsizescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Font Size App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FontSizeScreen(),
    );
  }
}
