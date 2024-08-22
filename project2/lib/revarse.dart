import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: ReverseNumber(),
  ));
}

class ReverseNumber extends StatefulWidget {
  const ReverseNumber({super.key});

  @override
  State<ReverseNumber> createState() => _ReverseNumberState();
}

class _ReverseNumberState extends State<ReverseNumber> {
  final TextEditingController _controller = TextEditingController();
  String _reversedNumber = '';

  void _reverseNumber(String input) {
    setState(() {
      _reversedNumber = input.split('').reversed.join();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Center(
            child: Text(
              "REVERSE NUMBER",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          _reverseNumber(value);
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                            hintText: "Enter any Number"),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                child: Column(
                  children: [
                    Text(
                      "Reversed number: $_reversedNumber",
                      style: const TextStyle(fontSize: 20),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
