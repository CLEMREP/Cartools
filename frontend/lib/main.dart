import 'package:flutter/material.dart';
import 'package:frontend/src/Views/page/CarburantPage.dart';
import 'package:frontend/src/Views/page/HomePage.dart';
import 'package:frontend/src/Views/page/LoginPage.dart';
import 'package:frontend/src/Views/page/RegisterFirstPage.dart';
import 'package:frontend/src/Views/page/RegisterSecondPage.dart';
import 'package:frontend/src/Views/page/RegisterVehiculePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/carburant',
      routes: {
        '/': (context) => const HomePage(),
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterFirstPage(),
        '/register/vehicule': (context) => const RegisterVehiculePage(),
        '/carburant': (context) => const CarburantPage(),
      },
    );
  }
}
