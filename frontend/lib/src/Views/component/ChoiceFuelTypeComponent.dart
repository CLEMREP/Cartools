import 'package:flutter/material.dart';
import 'package:frontend/src/Services/ColorManager.dart';
import 'package:frontend/src/Services/GlobalState.dart';
import 'package:frontend/src/Services/Providers/FilterProvider.dart';
import 'package:frontend/src/Services/http/QueryApi.dart';
import 'package:provider/provider.dart';

class ChoiceFuelTypeComponent extends StatefulWidget {

  final PageController controller;

  const ChoiceFuelTypeComponent({Key? key, required PageController this.controller}) : super(key: key);

  @override
  State<ChoiceFuelTypeComponent> createState() => _ChoiceFuelTypeComponentState();
}

class _ChoiceFuelTypeComponentState extends State<ChoiceFuelTypeComponent> {
  @override
  Widget build(BuildContext context) {
    return Consumer<FilterProvider>(
      builder: (context, filter, child) {
        return Container(
          child: Column(
            children: [
              Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.start,
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    GestureDetector(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 0, vertical: 15),
                        width: MediaQuery
                            .of(context)
                            .size
                            .width / 3 - 30,
                        decoration: BoxDecoration(
                          color: filter.fuelType == 0
                              ? ColorManager.primary
                              : ColorManager.invisible,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: ColorManager.primary,
                            width: 2,
                          ),
                        ),
                        child: Center(
                          child: Text('SP95',
                            style: TextStyle(
                              color: filter.fuelType == 0
                                  ? ColorManager.thirdly
                                  : ColorManager.secondary,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          filter.setFuelType(0);
                        });
                      },
                    ),
                    GestureDetector(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 0, vertical: 15),
                        width: MediaQuery
                            .of(context)
                            .size
                            .width / 3 - 30,
                        decoration: BoxDecoration(
                          color: filter.fuelType == 1
                              ? ColorManager.primary
                              : ColorManager.invisible,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: ColorManager.primary,
                            width: 2,
                          ),
                        ),
                        child: Center(
                          child: Text('SP98',
                            style: TextStyle(
                              color: filter.fuelType == 1
                                  ? ColorManager.thirdly
                                  : ColorManager.secondary,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          filter.setFuelType(1);
                        });
                      },
                    ),
                    GestureDetector(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 0, vertical: 15),
                        width: MediaQuery
                            .of(context)
                            .size
                            .width / 3 - 30,
                        decoration: BoxDecoration(
                          color: filter.fuelType == 2
                              ? ColorManager.primary
                              : ColorManager.invisible,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: ColorManager.primary,
                            width: 2,
                          ),
                        ),
                        child: Center(
                          child: Text('E10',
                            style: TextStyle(
                              color: filter.fuelType == 2
                                  ? ColorManager.thirdly
                                  : ColorManager.secondary,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          filter.setFuelType(2);
                        });
                      },
                    ),
                    GestureDetector(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 0, vertical: 15),
                        width: MediaQuery
                            .of(context)
                            .size
                            .width / 3 - 30,
                        decoration: BoxDecoration(
                          color: filter.fuelType == 3
                              ? ColorManager.primary
                              : ColorManager.invisible,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: ColorManager.primary,
                            width: 2,
                          ),
                        ),
                        child: Center(
                          child: Text('E85',
                            style: TextStyle(
                              color: filter.fuelType == 3
                                  ? ColorManager.thirdly
                                  : ColorManager.secondary,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          filter.setFuelType(3);
                        });
                      },
                    ),
                    GestureDetector(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 0, vertical: 15),
                        width: MediaQuery
                            .of(context)
                            .size
                            .width / 3 - 30,
                        decoration: BoxDecoration(
                          color: filter.fuelType == 4
                              ? ColorManager.primary
                              : ColorManager.invisible,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: ColorManager.primary,
                            width: 2,
                          ),
                        ),
                        child: Center(
                          child: Text('Gazole',
                            style: TextStyle(
                              color: filter.fuelType == 4
                                  ? ColorManager.thirdly
                                  : ColorManager.secondary,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          filter.setFuelType(4);
                        });
                      },
                    ),
                    GestureDetector(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 0, vertical: 15),
                        width: MediaQuery
                            .of(context)
                            .size
                            .width / 3 - 30,
                        decoration: BoxDecoration(
                          color: filter.fuelType == 5
                              ? ColorManager.primary
                              : ColorManager.invisible,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: ColorManager.primary,
                            width: 2,
                          ),
                        ),
                        child: Center(
                          child: Text('GPLc',
                            style: TextStyle(
                              color: filter.fuelType == 5
                                  ? ColorManager.thirdly
                                  : ColorManager.secondary,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          filter.setFuelType(5);
                        });
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
