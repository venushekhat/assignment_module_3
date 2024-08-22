import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              // Add margin around the image
              child: Image.network(
                height: 260,
                "https://img.freepik.com/free-photo/beautiful-natural-view-landscape_23-2150787996.jpg",
                fit: BoxFit.cover, // Ensure the image covers the container
                width: double
                    .infinity, // Make the image fill the width of the container
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              padding: const EdgeInsets.all(
                  16.0), // Add padding inside the container
              child: Row(
                crossAxisAlignment:
                    CrossAxisAlignment.start, // Align items to the start
                children: [
                  const Expanded(
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start, // Align text to the start
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 14.0),
                          child: Text(
                            "Oeschinen Lake Campground",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(height: 4.0), // Add space between text widgets
                        Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Text(
                            "Kandersteg Switzerland",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                      width: 16.0), // Add space between the text and the icon
                  Container(
                    margin: const EdgeInsets.only(
                        left: 6.0, top: 12), // Add margin around the icon
                    child: const Row(
                      children: [
                        Icon(
                          Icons.star, // Replace with the desired icon
                          color: Colors.red,
                        ),
                        SizedBox(
                            width:
                                3.0), // Add space between the icon and the text
                        Text(
                          "41", // Replace with the desired rating or text
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Icon(
                        Icons.call,
                        color: Colors.blue,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "CALL",
                        style: TextStyle(color: Colors.blueAccent),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Icon(
                        Icons.route,
                        color: Colors.blue,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "ROUTE",
                        style: TextStyle(color: Colors.blueAccent),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Icon(
                        Icons.share,
                        color: Colors.blue,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "SHARE",
                        style: TextStyle(color: Colors.blueAccent),
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              child: const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
