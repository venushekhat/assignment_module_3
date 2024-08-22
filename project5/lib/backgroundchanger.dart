import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: BackgroundChanger(),
    );
  }
}

class BackgroundChanger extends StatefulWidget {
  const BackgroundChanger({super.key});

  @override
  _BackgroundChangerState createState() => _BackgroundChangerState();
}

class _BackgroundChangerState extends State<BackgroundChanger> {
  Color _backgroundColor = Colors.white;

  void _changeBackgroundColor() {
    setState(() {
      _backgroundColor =
          _backgroundColor == const Color.fromARGB(255, 245, 137, 169)
              ? const Color.fromARGB(255, 2, 30, 43)
              : const Color.fromARGB(255, 245, 137, 169);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Background Changer'),
      ),
      body: Container(
        color: _backgroundColor,
        child: Center(
          child: ElevatedButton(
            onPressed: _changeBackgroundColor,
            child: const Text('Change Background'),
          ),
        ),
      ),
    );
  }
}
