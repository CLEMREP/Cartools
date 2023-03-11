import 'package:flutter/material.dart';
import 'package:frontend/src/Services/ColorManager.dart';
import 'package:frontend/src/Services/http/QueryApi.dart';

class ChoiceComponent extends StatefulWidget {
  const ChoiceComponent({Key? key}) : super(key: key);

  @override
  State<ChoiceComponent> createState() => _ChoiceComponentState();
}

class _ChoiceComponentState extends State<ChoiceComponent> {

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: ColorManager.primary,
          width: 2,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: GestureDetector(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                  color: selectedIndex == 0 ? ColorManager.primary : ColorManager.invisible,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(5),
                    bottomLeft: Radius.circular(5),
                  ),
                ),
                child: Center(
                  child: Text('Carburant',
                    style: TextStyle(
                      color: selectedIndex == 0 ? ColorManager.thirdly : ColorManager.secondary,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              onTap: () async {
                setState(() {
                  selectedIndex = 0;
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
                  color: selectedIndex == 1 ? ColorManager.primary : ColorManager.invisible,
                ),
                child: Center(
                  child: Text('Electrique',
                    style: TextStyle(
                      color: selectedIndex == 1 ? ColorManager.thirdly : ColorManager.secondary,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              onTap: () {
                setState(() {
                  selectedIndex = 1;
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
                  color: selectedIndex == 2 ? ColorManager.primary : ColorManager.invisible,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(5),
                    bottomRight: Radius.circular(5),
                  ),
                ),
                child: Center(
                  child: Text('Lavage',
                    style: TextStyle(
                      color: selectedIndex == 2 ? ColorManager.thirdly : ColorManager.secondary,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              onTap: () {
                setState(() {
                  selectedIndex = 2;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
