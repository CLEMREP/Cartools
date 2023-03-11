import 'package:flutter/material.dart';
import 'package:frontend/src/Services/ColorManager.dart';

class NavBarComponent extends StatefulWidget {

  final PageController controller;

  static int selectedIndex = 1;

  const NavBarComponent({Key? key, required PageController this.controller}) : super(key: key);

  @override
  State<NavBarComponent> createState() => _NavBarComponentState();
}

class _NavBarComponentState extends State<NavBarComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 0),
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
                        color: NavBarComponent.selectedIndex == 0 ? ColorManager.thirdly : ColorManager.thirdly50,
                        size: 30,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        width: 5,
                        height: 5,
                        decoration: BoxDecoration(
                          color: NavBarComponent.selectedIndex == 0 ? ColorManager.primary : ColorManager.invisible,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  setState(() {
                    widget.controller.animateToPage(
                      0,
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeInOut,
                    );
                  });
                },
              ),
              GestureDetector(
                child: Container(
                  child: Column(
                      children: [
                        Icon(
                          Icons.car_crash,
                          color: NavBarComponent.selectedIndex == 1 ? ColorManager.thirdly : ColorManager.thirdly50,
                          size: 30,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          width: 5,
                          height: 5,
                          decoration: BoxDecoration(
                            color: NavBarComponent.selectedIndex == 1 ? ColorManager.primary : ColorManager.invisible,
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ]
                  ),
                ),
                onTap: () {
                  setState(() {
                    widget.controller.animateToPage(
                      1,
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeInOut,
                    );
                  });
                },
              ),
              GestureDetector(
                child: Container(
                  child: Column(
                      children: [
                        Icon(
                          Icons.person,
                          color: NavBarComponent.selectedIndex == 2 ? ColorManager.thirdly : ColorManager.thirdly50,
                          size: 30,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          width: 5,
                          height: 5,
                          decoration: BoxDecoration(
                            color: NavBarComponent.selectedIndex == 2 ? ColorManager.primary : ColorManager.invisible,
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ]
                  ),
                ),
                onTap: () {
                  setState(() {
                    widget.controller.animateToPage(
                      2,
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeInOut,
                    );
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
