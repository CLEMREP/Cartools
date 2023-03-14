import 'package:flutter/material.dart';
import 'package:frontend/src/Services/ColorManager.dart';
import 'package:frontend/src/Services/GlobalState.dart';
import 'package:frontend/src/Services/http/QueryApi.dart';

class ChoiceFuelTypeComponent extends StatefulWidget {

  final PageController controller;

  static int selectedIndexChoiceFuelTypeComponent = 0;

  const ChoiceFuelTypeComponent({Key? key, required PageController this.controller}) : super(key: key);

  @override
  State<ChoiceFuelTypeComponent> createState() => _ChoiceFuelTypeComponentState();
}

class _ChoiceFuelTypeComponentState extends State<ChoiceFuelTypeComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.start,
              spacing: 10,
              runSpacing: 10,
              children: [
                GestureDetector(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 15),
                    width: MediaQuery.of(context).size.width / 3 - 30,
                    decoration: BoxDecoration(
                      color: ChoiceFuelTypeComponent.selectedIndexChoiceFuelTypeComponent == 0 ? ColorManager.primary : ColorManager.invisible,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: ColorManager.primary,
                        width: 2,
                      ),
                    ),
                    child: Center(
                      child: Text('SP95',
                        style: TextStyle(
                          color: ChoiceFuelTypeComponent.selectedIndexChoiceFuelTypeComponent == 0 ? ColorManager.thirdly : ColorManager.secondary,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      ChoiceFuelTypeComponent.selectedIndexChoiceFuelTypeComponent = 0;
                    });
                  },
                ),
                GestureDetector(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 15),
                    width: MediaQuery.of(context).size.width / 3 - 30,
                    decoration: BoxDecoration(
                      color: ChoiceFuelTypeComponent.selectedIndexChoiceFuelTypeComponent == 1 ? ColorManager.primary : ColorManager.invisible,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: ColorManager.primary,
                        width: 2,
                      ),
                    ),
                    child: Center(
                      child: Text('SP98',
                        style: TextStyle(
                          color: ChoiceFuelTypeComponent.selectedIndexChoiceFuelTypeComponent == 1 ? ColorManager.thirdly : ColorManager.secondary,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      ChoiceFuelTypeComponent.selectedIndexChoiceFuelTypeComponent = 1;
                    });
                  },
                ),
                GestureDetector(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 15),
                    width: MediaQuery.of(context).size.width / 3 - 30,
                    decoration: BoxDecoration(
                      color: ChoiceFuelTypeComponent.selectedIndexChoiceFuelTypeComponent == 2 ? ColorManager.primary : ColorManager.invisible,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: ColorManager.primary,
                        width: 2,
                      ),
                    ),
                    child: Center(
                      child: Text('SP95 E10',
                        style: TextStyle(
                          color: ChoiceFuelTypeComponent.selectedIndexChoiceFuelTypeComponent == 2 ? ColorManager.thirdly : ColorManager.secondary,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      ChoiceFuelTypeComponent.selectedIndexChoiceFuelTypeComponent = 2;
                    });
                  },
                ),
                GestureDetector(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 15),
                    width: MediaQuery.of(context).size.width / 3 - 30,
                    decoration: BoxDecoration(
                      color: ChoiceFuelTypeComponent.selectedIndexChoiceFuelTypeComponent == 3 ? ColorManager.primary : ColorManager.invisible,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: ColorManager.primary,
                        width: 2,
                      ),
                    ),
                    child: Center(
                      child: Text('E85',
                        style: TextStyle(
                          color: ChoiceFuelTypeComponent.selectedIndexChoiceFuelTypeComponent == 3 ? ColorManager.thirdly : ColorManager.secondary,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      ChoiceFuelTypeComponent.selectedIndexChoiceFuelTypeComponent = 3;
                    });
                  },
                ),
                GestureDetector(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 15),
                    width: MediaQuery.of(context).size.width / 3 - 30,
                    decoration: BoxDecoration(
                      color: ChoiceFuelTypeComponent.selectedIndexChoiceFuelTypeComponent == 4 ? ColorManager.primary : ColorManager.invisible,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: ColorManager.primary,
                        width: 2,
                      ),
                    ),
                    child: Center(
                      child: Text('Gazole',
                        style: TextStyle(
                          color: ChoiceFuelTypeComponent.selectedIndexChoiceFuelTypeComponent == 4 ? ColorManager.thirdly : ColorManager.secondary,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      ChoiceFuelTypeComponent.selectedIndexChoiceFuelTypeComponent = 4;
                    });
                  },
                ),
                GestureDetector(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 15),
                    width: MediaQuery.of(context).size.width / 3 - 30,
                    decoration: BoxDecoration(
                      color: ChoiceFuelTypeComponent.selectedIndexChoiceFuelTypeComponent == 5 ? ColorManager.primary : ColorManager.invisible,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: ColorManager.primary,
                        width: 2,
                      ),
                    ),
                    child: Center(
                      child: Text('GPL',
                        style: TextStyle(
                          color: ChoiceFuelTypeComponent.selectedIndexChoiceFuelTypeComponent == 5 ? ColorManager.thirdly : ColorManager.secondary,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      ChoiceFuelTypeComponent.selectedIndexChoiceFuelTypeComponent = 5;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
