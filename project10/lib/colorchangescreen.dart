import 'package:flutter/material.dart';

class ColorChangerScreen extends StatefulWidget {
  const ColorChangerScreen({super.key});

  @override
  _ColorChangerScreenState createState() => _ColorChangerScreenState();
}

class _ColorChangerScreenState extends State<ColorChangerScreen> {
  double _redValue = 0.0;
  double _greenValue = 0.0;
  double _blueValue = 0.0;

  Color _backgroundColor = Colors.white;

  void _updateBackgroundColor() {
    setState(() {
      _backgroundColor = Color.fromRGBO(
        _redValue.toInt(),
        _greenValue.toInt(),
        _blueValue.toInt(),
        1.0,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SeekBar Color Changer'),
      ),
      body: Container(
        color: _backgroundColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildSlider(
              'Red',
              _redValue,
              (value) {
                setState(() {
                  _redValue = value;
                });
                _updateBackgroundColor();
              },
            ),
            _buildSlider(
              'Green',
              _greenValue,
              (value) {
                setState(() {
                  _greenValue = value;
                });
                _updateBackgroundColor();
              },
            ),
            _buildSlider(
              'Blue',
              _blueValue,
              (value) {
                setState(() {
                  _blueValue = value;
                });
                _updateBackgroundColor();
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSlider(
      String label, double value, ValueChanged<double> onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Column(
        children: [
          Text(
            '$label: ${value.toInt()}',
            style: const TextStyle(fontSize: 20),
          ),
          Slider(
            value: value,
            min: 0.0,
            max: 255.0,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
