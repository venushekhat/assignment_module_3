import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:food_delivery/Widget/App_Constant.dart';
import 'package:food_delivery/admin/admin_login.dart';

// adb connect tcpip 5555
// adb connect ipaddres

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Correct usage of publishableKey
  print('Publishable Key: $publishableKey');

  await Firebase.initializeApp().then((value) {
    print("firebase : ${Firebase.app().options.projectId}");
  });
  runApp(const MyApp());
}

// void main() async {
//   await _setup();
//   runApp(const MyApp());
// }

Future<void> _setup() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = secretKey;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AdminLogin(),
    );
  }
}
