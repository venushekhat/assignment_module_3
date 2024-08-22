import 'package:flutter/material.dart';

class FontSizeScreen extends StatefulWidget {
  const FontSizeScreen({super.key});

  @override
  _FontSizeScreenState createState() => _FontSizeScreenState();
}

class _FontSizeScreenState extends State<FontSizeScreen> {
  double _fontSize = 16.0; // Initial font size

  void _increaseFontSize() {
    setState(() {
      _fontSize += 2.0; // Increase font size
    });
  }

  void _decreaseFontSize() {
    setState(() {
      if (_fontSize > 8.0) {
        _fontSize -= 2.0; // Decrease font size
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Font Size Adjuster'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Adjust the font size',
              style: TextStyle(fontSize: _fontSize),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: _decreaseFontSize,
                  tooltip: 'Decrease Font Size',
                ),
                const SizedBox(width: 20),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: _increaseFontSize,
                  tooltip: 'Increase Font Size',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
