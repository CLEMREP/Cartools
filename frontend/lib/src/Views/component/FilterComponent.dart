import 'package:flutter/material.dart';
import 'package:frontend/src/Services/ColorManager.dart';
import 'package:frontend/src/Services/GlobalState.dart';
import 'package:frontend/src/Views/component/ChoiceComponent.dart';
import 'package:frontend/src/Views/page/ElectricPage.dart';
import 'package:frontend/src/Views/page/FuelPage.dart';
import 'package:frontend/src/Views/page/WashingPage.dart';

class FilterComponent extends StatefulWidget {
  const FilterComponent({Key? key}) : super(key: key);

  @override
  State<FilterComponent> createState() => _FilterComponentState();
}

class _FilterComponentState extends State<FilterComponent> {
  @override
  Widget build(BuildContext context) {

    final PageController controller = PageController(
      initialPage: 0,
    );

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.9,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: Column(
        children: [
          Container(
            width: 40,
            height: 4,
            color: Colors.black12,
          ),
          const SizedBox(
            height: 20,
          ),
          const Text('Définir les filtres',
            style: TextStyle(
              color: ColorManager.secondary,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ChoiceComponent(controller: controller),
          Expanded(
            child: PageView(
              controller: controller,
              onPageChanged: (index) {
                setState(() {
                  ChoiceComponent.selectedIndexChoiceComponent = index;
                });
              },
              children: const [
                FuelPage(),
                ElectricPage(),
                WashingPage(),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              GlobalState.filterController.isAttached
                  ? GlobalState.filterController.close()
                  : GlobalState.filterController.open();
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              decoration: BoxDecoration(
                color: ColorManager.secondary,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                child: Text('Appliquer les filtres',
                  style: TextStyle(
                    color: ColorManager.thirdly,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}