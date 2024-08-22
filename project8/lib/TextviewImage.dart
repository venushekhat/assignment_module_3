import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ImagesAroundText(), // Use ImagesAroundText as the home screen
    );
  }
}

class ImagesAroundText extends StatelessWidget {
  const ImagesAroundText({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Images Around Text')),
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            left: 10, // Adjust the positioning as needed
            top: 10,
            child: Image.network(
              'https://images.unsplash.com/photo-1721332153282-3be1f363074d?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxmZWF0dXJlZC1waG90b3MtZmVlZHwxfHx8ZW58MHx8fHx8',
              width: 120, // Increased width
              height: 120, // Increased height
            ),
          ),
          Positioned(
            right: 10,
            top: 10,
            child: Image.network(
              'https://images.unsplash.com/photo-1723155094419-5ac8b25072d7?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHw1fHx8ZW58MHx8fHx8',
              width: 120, // Increased width
              height: 120, // Increased height
            ),
          ),
          Positioned(
            left: 10,
            bottom: 10,
            child: Image.network(
              'https://images.unsplash.com/photo-1719937206491-ed673f64be1f?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxmZWF0dXJlZC1waG90b3MtZmVlZHwxNnx8fGVufDB8fHx8fA%3D%3D',
              width: 120, // Increased width
              height: 120, // Increased height
            ),
          ),
          Positioned(
            right: 10,
            bottom: 10,
            child: Image.network(
              'https://images.unsplash.com/photo-1722608274454-699ed706d7f5?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHwyOHx8fGVufDB8fHx8fA%3D%3D',
              width: 120, // Increased width
              height: 120, // Increased height
            ),
          ),
          const Center(
            child: Text(
              'Center Text',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
