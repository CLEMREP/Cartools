import 'package:flutter/material.dart';
import 'package:frontend/src/Views/component/NavBarComponent.dart';
import 'package:frontend/src/Views/component/PlaceComponent.dart';
import 'package:frontend/src/Views/page/CarburantPage.dart';
import 'package:frontend/src/Views/page/LoginPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();
    return Scaffold(
      body: PageView(
        controller: controller,
        children: const [
          CarburantPage(),
          LoginPage(),
        ],
      ),
      bottomNavigationBar: NavBarComponent(controller: controller),
    );
  }
}
