import 'package:flutter/material.dart';
import 'package:frontend/src/Db/model/User.dart';
import 'package:frontend/src/Services/GlobalState.dart';
import 'package:frontend/src/Services/Providers/FilterProvider.dart';
import 'package:frontend/src/Services/http/QueryApi.dart';
import 'package:frontend/src/Views/page/DetailPage.dart';
import 'package:frontend/src/Views/page/StationPage.dart';
import 'package:frontend/src/Views/page/HomePage.dart';
import 'package:frontend/src/Views/page/LoginPage.dart';
import 'package:frontend/src/Views/page/RegisterFirstPage.dart';
import 'package:frontend/src/Views/page/RegisterSecondPage.dart';
import 'package:frontend/src/Views/page/RegisterVehiculePage.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();
  var token = prefs.getString('token');

  if(token != null) {
    bool response = await QueryApi.getUser();

    bool response2 = await QueryApi.getGazStations();
  }

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => FilterProvider()),
      ],
      child: MyApp(token: token),
    ),
  );
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
        '/': (context) {
          if(token == null) {
            return const LoginPage();
          } else {
            if(User.vehicule != null) {
              return const HomePage();
            } else {
              return const RegisterVehiculePage();
            }
          }
        },
        '/home': (context) => User.vehicule != null ? const HomePage() : const RegisterVehiculePage(),
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterFirstPage(),
        '/register/vehicule': (context) => const RegisterVehiculePage(),
        '/carburant': (context) => const StationPage(),
      },
    );
  }
}
