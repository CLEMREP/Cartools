import 'package:flutter/material.dart';
import 'package:frontend/src/Services/ColorManager.dart';

class NavBarComponent extends StatefulWidget {
  const NavBarComponent({Key? key}) : super(key: key);

  @override
  State<NavBarComponent> createState() => _NavBarComponentState();
}

class _NavBarComponentState extends State<NavBarComponent> {

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 25),
      decoration: BoxDecoration(
        color: ColorManager.secondary,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.map,
            color: selectedIndex == 0 ? ColorManager.thirdly : ColorManager.secondary,
            size: 30,
          ),
          Icon(Icons.car_crash,
            color: ColorManager.thirdly,
            size: 30,
          ),
          Icon(Icons.person,
            color: ColorManager.thirdly,
            size: 30,
          ),
        ],
      ),
    );
  }
}
