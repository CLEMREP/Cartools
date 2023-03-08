import 'package:flutter/material.dart';
import 'package:frontend/src/Services/ColorManager.dart';

class NavBarComponent extends StatefulWidget {

  final PageController controller;

  const NavBarComponent({Key? key, required PageController this.controller}) : super(key: key);

  @override
  State<NavBarComponent> createState() => _NavBarComponentState();
}

class _NavBarComponentState extends State<NavBarComponent> {

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 18),
      decoration: BoxDecoration(
        color: ColorManager.secondary,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                child: Container(
                  child: Column(
                    children: [
                      Icon(
                        Icons.map,
                        color: selectedIndex == 0 ? ColorManager.thirdly : ColorManager.thirdly50,
                        size: 30,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        width: 5,
                        height: 5,
                        decoration: BoxDecoration(
                          color: selectedIndex == 0 ? ColorManager.primary : ColorManager.invisible,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  setState(() {
                    selectedIndex = 0;
                  });
                },
              ),
              GestureDetector(
                child: Container(
                  child: Column(
                      children: [
                        Icon(
                          Icons.car_crash,
                          color: selectedIndex == 1 ? ColorManager.thirdly : ColorManager.thirdly50,
                          size: 30,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          width: 5,
                          height: 5,
                          decoration: BoxDecoration(
                            color: selectedIndex == 1 ? ColorManager.primary : ColorManager.invisible,
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ]
                  ),
                ),
                onTap: () {
                  setState(() {
                    selectedIndex = 1;
                  });
                },
              ),
              GestureDetector(
                child: Container(
                  child: Column(
                      children: [
                        Icon(
                          Icons.person,
                          color: selectedIndex == 2 ? ColorManager.thirdly : ColorManager.thirdly50,
                          size: 30,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          width: 5,
                          height: 5,
                          decoration: BoxDecoration(
                            color: selectedIndex == 2 ? ColorManager.primary : ColorManager.invisible,
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ]
                  ),
                ),
                onTap: () {
                  setState(() {
                    selectedIndex = 2;
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
