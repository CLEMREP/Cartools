import 'package:flutter/material.dart';
import 'package:frontend/src/Services/ColorManager.dart';
import 'package:frontend/src/Views/component/BetweenPlaceComponent.dart';
import 'package:frontend/src/Views/component/ChoiceComponent.dart';
import 'package:frontend/src/Views/component/NavBarComponent.dart';
import 'package:frontend/src/Views/component/PlaceComponent.dart';

class CarburantPage extends StatefulWidget {
  const CarburantPage({Key? key}) : super(key: key);

  @override
  State<CarburantPage> createState() => _CarburantPageState();
}

class _CarburantPageState extends State<CarburantPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            ChoiceComponent(),
            ListView.builder(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              shrinkWrap: true,
              itemCount: 3,
              itemBuilder: (context, index) {
                return (index % 2 == 0)
                    ? const PlaceComponent()
                    : const BetweenPlaceComponent();
              },
            ),
          ],
        )
      ),
    );
  }
}
