import 'package:flutter/material.dart';

class ColorSelectorScreen extends StatefulWidget {
  const ColorSelectorScreen({super.key});

  @override
  _ColorSelectorScreenState createState() => _ColorSelectorScreenState();
}

class _ColorSelectorScreenState extends State<ColorSelectorScreen> {
  // The selected color
  Color _selectedColor = Colors.white;

  // The value of the selected radio button
  int _selectedColorIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Color Selector'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RadioListTile<int>(
            title: const Text('Red'),
            value: 0,
            groupValue: _selectedColorIndex,
            onChanged: (value) {
              setState(() {
                _selectedColorIndex = value!;
                _selectedColor = Colors.red;
              });
            },
          ),
          RadioListTile<int>(
            title: const Text('Green'),
            value: 1,
            groupValue: _selectedColorIndex,
            onChanged: (value) {
              setState(() {
                _selectedColorIndex = value!;
                _selectedColor = Colors.green;
              });
            },
          ),
          RadioListTile<int>(
            title: const Text('Blue'),
            value: 2,
            groupValue: _selectedColorIndex,
            onChanged: (value) {
              setState(() {
                _selectedColorIndex = value!;
                _selectedColor = Colors.blue;
              });
            },
          ),
          Expanded(
            child: Container(
              color: _selectedColor,
              child: const Center(
                child: Text(
                  'Selected Color',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
