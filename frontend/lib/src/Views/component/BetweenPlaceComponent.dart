import 'package:flutter/material.dart';
import 'package:frontend/src/Services/ColorManager.dart';

class BetweenPlaceComponent extends StatefulWidget {
  const BetweenPlaceComponent({Key? key}) : super(key: key);

  @override
  State<BetweenPlaceComponent> createState() => _BetweenPlaceComponentState();
}

class _BetweenPlaceComponentState extends State<BetweenPlaceComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            height: 1,
            color: ColorManager.secondary50,
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      )
    );
  }
}
