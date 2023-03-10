import 'package:flutter/material.dart';
import 'package:frontend/src/Services/ColorManager.dart';
import 'package:frontend/src/Views/component/NavBarComponent.dart';
import 'package:frontend/src/Views/component/PlaceComponent.dart';
import 'package:frontend/src/Views/page/CarburantPage.dart';
import 'package:frontend/src/Views/page/LoginPage.dart';
import 'package:frontend/src/Views/page/MapPage.dart';
import 'package:frontend/src/Views/page/ProfilePage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {

    final PageController controller = PageController(
      initialPage: 1,
    );

    return Scaffold(
      body: PageView(
        controller: controller,
        onPageChanged: (index) {
          setState(() {
            NavBarComponent.selectedIndex = index;
          });
        },
        children: const [
          MapPage(),
          CarburantPage(),
          ProfilePage(),
        ],
      ),
      bottomNavigationBar: NavBarComponent(controller: controller),
    );
  }
}
