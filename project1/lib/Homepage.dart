import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              height: 260,
              width: double.maxFinite,
              color: Colors.red,
            ),
            const SizedBox(
              height: 6,
            ),
            Container(
              child: Row(
                children: [
                  Container(
                    height: 180,
                    width: 177,
                    color: Colors.blueAccent[200],
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  Container(
                    height: 180,
                    width: 177,
                    color: Colors.blueAccent[200],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            Container(
              child: Row(
                children: [
                  Container(
                    height: 180,
                    width: 177,
                    color: Colors.blueAccent[200],
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  Container(
                    height: 180,
                    width: 177,
                    color: Colors.blueAccent[200],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            Container(
              child: Row(
                children: [
                  Container(
                    height: 130,
                    width: 115,
                    color: Colors.amber[200],
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  Container(
                    height: 130,
                    width: 115,
                    color: Colors.amber[200],
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  Container(
                    height: 130,
                    width: 115,
                    color: Colors.amber[200],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
