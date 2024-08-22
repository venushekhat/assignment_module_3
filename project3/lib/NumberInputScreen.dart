import 'package:flutter/material.dart';

class NumberInputScreen extends StatefulWidget {
  const NumberInputScreen({super.key});

  @override
  _NumberInputScreenState createState() => _NumberInputScreenState();
}

class _NumberInputScreenState extends State<NumberInputScreen> {
  final _controllerStart = TextEditingController();
  final _controllerEnd = TextEditingController();

  void _submit() {
    final int? start = int.tryParse(_controllerStart.text);
    final int? end = int.tryParse(_controllerEnd.text);

    if (start != null && end != null && start <= end) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => NumberRangeScreen(start: start, end: end),
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Invalid input'),
          content: const Text(
            'Please enter valid numbers with the start number less than or equal to the end number.',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Input Numbers'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controllerStart,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Start Number'),
            ),
            TextField(
              controller: _controllerEnd,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'End Number'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submit,
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}

class NumberRangeScreen extends StatelessWidget {
  final int start;
  final int end;

  const NumberRangeScreen({required this.start, required this.end, super.key});

  @override
  Widget build(BuildContext context) {
    final List<int> numbers =
        List.generate(end - start + 1, (index) => start + index);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Number Range'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: numbers.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('${numbers[index]}'),
            );
          },
        ),
      ),
    );
  }
}
