import 'package:flutter/material.dart';
import 'package:frontend/src/Services/http/QueryApi.dart';
import 'package:frontend/src/Views/page/CarburantPage.dart';
import 'package:frontend/src/Views/page/HomePage.dart';
import 'package:frontend/src/Views/page/LoginPage.dart';
import 'package:frontend/src/Views/page/RegisterFirstPage.dart';
import 'package:frontend/src/Views/page/RegisterSecondPage.dart';
import 'package:frontend/src/Views/page/RegisterVehiculePage.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();
  var token = prefs.getString('token');

  bool response = await QueryApi.getUser();

  runApp(MyApp(token: token));
}

class MyApp extends StatelessWidget {
  final String? token;

  const MyApp({super.key, this.token});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => token == null ? const LoginPage() : const HomePage(),
        '/home': (context) => const HomePage(),
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterFirstPage(),
        '/register/vehicule': (context) => const RegisterVehiculePage(),
        '/carburant': (context) => const CarburantPage(),
      },
    );
  }
}
