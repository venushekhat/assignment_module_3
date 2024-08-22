import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _num1Controller = TextEditingController();
  final TextEditingController _num2Controller = TextEditingController();
  String _selectedOperation = 'Add';
  String _result = '';

  void _calculateResult() {
    final num1 = double.tryParse(_num1Controller.text) ?? 0;
    final num2 = double.tryParse(_num2Controller.text) ?? 0;

    double result;
    switch (_selectedOperation) {
      case 'Add':
        result = num1 + num2;
        break;
      case 'Substraction':
        result = num1 - num2;
        break;
      case 'Multiply':
        result = num1 * num2;
        break;
      case 'Division':
        if (num2 == 0) {
          setState(() {
            _result = 'Cannot divide by zero';
          });
          return;
        }
        result = num1 / num2;
        break;
      default:
        result = 0;
    }

    setState(() {
      _result = 'Result: $result';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextField(
              controller: _num1Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Number 1'),
            ),
            TextField(
              controller: _num2Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Number 2'),
            ),
            const SizedBox(height: 16.0),
            const Text('Select Operation:'),
            Column(
              children: <Widget>[
                RadioListTile<String>(
                  title: const Text('Add'),
                  value: 'Add',
                  groupValue: _selectedOperation,
                  onChanged: (value) => setState(() {
                    _selectedOperation = value!;
                  }),
                ),
                RadioListTile<String>(
                  title: const Text('Substraction'),
                  value: 'Substraction',
                  groupValue: _selectedOperation,
                  onChanged: (value) => setState(() {
                    _selectedOperation = value!;
                  }),
                ),
                RadioListTile<String>(
                  title: const Text('Multiply'),
                  value: 'Multiply',
                  groupValue: _selectedOperation,
                  onChanged: (value) => setState(() {
                    _selectedOperation = value!;
                  }),
                ),
                RadioListTile<String>(
                  title: const Text('Division'),
                  value: 'Division',
                  groupValue: _selectedOperation,
                  onChanged: (value) => setState(() {
                    _selectedOperation = value!;
                  }),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _calculateResult,
              child: const Text('Calculate'),
            ),
            const SizedBox(height: 16.0),
            Text(
              _result,
              style: const TextStyle(fontSize: 24.0),
            ),
          ],
        ),
      ),
    );
  }
}
