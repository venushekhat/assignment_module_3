import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkbox Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            CheckboxListTile(
              title: const Text(
                'Show Text',
                style: TextStyle(fontSize: 22),
              ),
              value: _isChecked,
              onChanged: (bool? value) {
                setState(() {
                  _isChecked = value ?? false;
                });
              },
            ),
            const SizedBox(
              height: 30,
            ),
            if (_isChecked) // Display Text if checkbox is checked
              const Text(
                'Checkbox is checked!',
                style: TextStyle(fontSize: 24),
              ),
          ],
        ),
      ),
    );
  }
}
