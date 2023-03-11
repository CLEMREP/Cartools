import 'package:flutter/material.dart';
import 'package:frontend/src/Db/model/GazStation.dart';
import 'package:frontend/src/Services/ColorManager.dart';

class PlaceComponent extends StatefulWidget {
  final GazStation gazStation;

  const PlaceComponent({Key? key, required this.gazStation}) : super(key: key);

  @override
  State<PlaceComponent> createState() => _PlaceComponentState();
}

class _PlaceComponentState extends State<PlaceComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: const BoxDecoration(
                  color: ColorManager.primary,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: const Center(
                  child: Icon(Icons.ev_station,
                    color: ColorManager.thirdly,
                    size: 30,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                width: 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.gazStation.address,
                      style: const TextStyle(
                        color: ColorManager.secondary,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Container(
                      child: Row(
                          children: const [
                            Text('SP95:',
                              style: TextStyle(
                                color: ColorManager.secondary,
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text('1,865€',
                              style: TextStyle(
                                color: ColorManager.primary,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ]
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Icon(Icons.arrow_forward_ios,
            color: ColorManager.secondary,
            size: 15,
          ),
        ],
      ),
    );
  }
}
