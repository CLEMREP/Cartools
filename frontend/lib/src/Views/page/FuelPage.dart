import 'package:flutter/material.dart';
import 'package:frontend/src/Services/ColorManager.dart';
import 'package:frontend/src/Views/component/ChoiceFuelTypeComponent.dart';
import 'package:frontend/src/Views/component/ChoiceRadiusComponent.dart';

class FuelPage extends StatefulWidget {
  const FuelPage({Key? key}) : super(key: key);

  @override
  State<FuelPage> createState() => _FuelPageState();
}

class _FuelPageState extends State<FuelPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
      child: Column(
        children: [
          Row(
            children: const [
              Text('Fuel type',
                style: TextStyle(
                  color: ColorManager.secondary,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          ChoiceFuelTypeComponent(controller: PageController()),
          const SizedBox(
            height: 40,
          ),
          Row(
            children: const [
              Text('Radius',
                style: TextStyle(
                  color: ColorManager.secondary,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          ChoiceRadiusComponent(controller: PageController()),
        ],
      )
    );
  }
}
