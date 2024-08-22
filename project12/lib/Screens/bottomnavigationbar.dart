import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/Screens/Homepage.dart';
import 'package:food_delivery/Screens/order.dart';
import 'package:food_delivery/Screens/profile.dart';
import 'package:food_delivery/Screens/wallet.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int currentTabIndex = 0;

  final List<Widget> screens = [
    const Homepage(),
    const Order(),
    const Wallet(),
    const Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentTabIndex],
      bottomNavigationBar: CurvedNavigationBar(
          height: 65,
          backgroundColor: Colors.white,
          color: Colors.black,
          animationDuration: const Duration(milliseconds: 500),
          onTap: (int index) {
            setState(() {
              currentTabIndex = index;
            });
          },
          items: const [
            Icon(
              Icons.home_outlined,
              color: Colors.white,
              size: 30,
            ),
            Icon(
              Icons.shopping_bag_outlined,
              color: Colors.white,
              size: 30,
            ),
            Icon(
              Icons.wallet_outlined,
              color: Colors.white,
              size: 30,
            ),
            Icon(
              Icons.person_2_outlined,
              color: Colors.white,
              size: 30,
            ),
          ]),
      // body:  Wallet(),
    );
  }
}
