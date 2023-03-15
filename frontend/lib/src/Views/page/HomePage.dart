import 'package:flutter/material.dart';
import 'package:frontend/src/Services/ColorManager.dart';
import 'package:frontend/src/Services/GlobalState.dart';
import 'package:frontend/src/Views/component/FilterComponent.dart';
import 'package:frontend/src/Views/component/NavBarComponent.dart';
import 'package:frontend/src/Views/component/PlaceComponent.dart';
import 'package:frontend/src/Views/page/StationPage.dart';
import 'package:frontend/src/Views/page/LoginPage.dart';
import 'package:frontend/src/Views/page/MapPage.dart';
import 'package:frontend/src/Views/page/ProfilePage.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

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
      body: SlidingUpPanel(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
        minHeight: 0,
        maxHeight: MediaQuery.of(context).size.height * 0.7, // 9
        backdropEnabled: true,
        controller: GlobalState.filterController,
        panel: const FilterComponent(),
        body: Stack(
          children: [
            PageView(
              controller: controller,
              onPageChanged: (index) {
                setState(() {
                  NavBarComponent.selectedIndex = index;
                });
              },
              children: const [
                MapPage(),
                StationPage(),
                ProfilePage(),
              ],
            ),
            NavBarComponent(controller: controller),
          ],
        ),
      ),
    );
  }
}
