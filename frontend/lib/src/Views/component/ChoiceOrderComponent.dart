import 'package:flutter/material.dart';
import 'package:frontend/src/Services/ColorManager.dart';
import 'package:frontend/src/Services/GlobalState.dart';
import 'package:frontend/src/Services/Providers/FilterProvider.dart';
import 'package:frontend/src/Services/http/QueryApi.dart';
import 'package:frontend/src/Views/page/StationPage.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChoiceOrderComponent extends StatefulWidget {

  final PageController controller;

  const ChoiceOrderComponent({Key? key, required PageController this.controller}) : super(key: key);

  @override
  State<ChoiceOrderComponent> createState() => _ChoiceOrderComponentState();
}

class _ChoiceOrderComponentState extends State<ChoiceOrderComponent> {
  @override
  Widget build(BuildContext context) {
    return Consumer<FilterProvider>(
      builder: (context, filter, child) {
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
                      color: filter.isOrder ? ColorManager.invisible : ColorManager.primary,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text('Le plus proche',
                        style: TextStyle(
                          color: filter.isOrder ? ColorManager.secondary : ColorManager.thirdly,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                  onTap: () async {
                    final prefs = await SharedPreferences.getInstance();
                    prefs.setBool('order', false);
                    setState(() {
                      filter.setIsOrder(false);
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
                      color: filter.isOrder ? ColorManager.primary : ColorManager.invisible,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text('le moins cher',
                        style: TextStyle(
                          color: filter.isOrder ? ColorManager.thirdly : ColorManager.secondary,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                  onTap: () async {
                    final prefs = await SharedPreferences.getInstance();
                    prefs.setBool('order', true);
                    setState(() {
                      filter.setIsOrder(true);
                    });
                  },
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}
