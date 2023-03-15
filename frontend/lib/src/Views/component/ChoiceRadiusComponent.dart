import 'package:flutter/material.dart';
import 'package:frontend/src/Services/ColorManager.dart';
import 'package:frontend/src/Services/GlobalState.dart';
import 'package:frontend/src/Services/http/QueryApi.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChoiceRadiusComponent extends StatefulWidget {

  final PageController controller;

  static int selectedIndexChoiceRadiusComponent = 0;

  const ChoiceRadiusComponent({Key? key, required PageController this.controller}) : super(key: key);

  @override
  State<ChoiceRadiusComponent> createState() => _ChoiceRadiusComponentState();
}

class _ChoiceRadiusComponentState extends State<ChoiceRadiusComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: ColorManager.secondary50,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: GestureDetector(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                  color: ChoiceRadiusComponent.selectedIndexChoiceRadiusComponent == 0 ? ColorManager.primary : ColorManager.invisible,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text('1 km',
                    style: TextStyle(
                      color: ChoiceRadiusComponent.selectedIndexChoiceRadiusComponent == 0 ? ColorManager.thirdly : ColorManager.secondary,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              onTap: () async {
                final prefs = await SharedPreferences.getInstance();
                setState(() {
                  ChoiceRadiusComponent.selectedIndexChoiceRadiusComponent = 0;
                  prefs.setInt('radius', 1);
                });
              },
            ),
          ),
          Container(
            width: 1,
            height: 20,
            color: ColorManager.secondary50,
          ),
          Expanded(
            child: GestureDetector(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                  color: ChoiceRadiusComponent.selectedIndexChoiceRadiusComponent == 1 ? ColorManager.primary : ColorManager.invisible,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text('5 km',
                    style: TextStyle(
                      color: ChoiceRadiusComponent.selectedIndexChoiceRadiusComponent == 1 ? ColorManager.thirdly : ColorManager.secondary,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              onTap: () async {
                final prefs = await SharedPreferences.getInstance();
                setState(() {
                  ChoiceRadiusComponent.selectedIndexChoiceRadiusComponent = 1;
                  prefs.setInt('radius', 5);
                });
              },
            ),
          ),
          Container(
            width: 1,
            height: 20,
            color: ColorManager.secondary50,
          ),
          Expanded(
            child: GestureDetector(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                  color: ChoiceRadiusComponent.selectedIndexChoiceRadiusComponent == 2 ? ColorManager.primary : ColorManager.invisible,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text('20 km',
                    style: TextStyle(
                      color: ChoiceRadiusComponent.selectedIndexChoiceRadiusComponent == 2 ? ColorManager.thirdly : ColorManager.secondary,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              onTap: () async {
                final prefs = await SharedPreferences.getInstance();
                setState(() {
                  ChoiceRadiusComponent.selectedIndexChoiceRadiusComponent = 2;
                  prefs.setInt('radius', 20);
                });
              },
            ),
          ),
          Container(
            width: 1,
            height: 20,
            color: ColorManager.secondary50,
          ),
          Expanded(
            child: GestureDetector(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                  color: ChoiceRadiusComponent.selectedIndexChoiceRadiusComponent == 3 ? ColorManager.primary : ColorManager.invisible,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text('50 km',
                    style: TextStyle(
                      color: ChoiceRadiusComponent.selectedIndexChoiceRadiusComponent == 3 ? ColorManager.thirdly : ColorManager.secondary,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              onTap: () async {
                final prefs = await SharedPreferences.getInstance();
                setState(() {
                  ChoiceRadiusComponent.selectedIndexChoiceRadiusComponent = 3;
                  prefs.setInt('radius', 50);
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}