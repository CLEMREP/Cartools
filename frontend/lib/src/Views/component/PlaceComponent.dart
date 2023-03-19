import 'package:flutter/material.dart';
import 'package:frontend/src/Db/model/GazStation.dart';
import 'package:frontend/src/Db/model/User.dart';
import 'package:frontend/src/Db/repository/GazStationRepository.dart';
import 'package:frontend/src/Services/ColorManager.dart';
import 'package:frontend/src/Services/GeolocatorPosition.dart';
import 'package:frontend/src/Views/page/DetailPage.dart';
import 'package:geolocator/geolocator.dart';

class PlaceComponent extends StatefulWidget {
  final GazStation gazStation;
  final int fuelType;

  const PlaceComponent({Key? key, required this.gazStation, required this.fuelType}) : super(key: key);

  @override
  State<PlaceComponent> createState() => _PlaceComponentState();
}

class _PlaceComponentState extends State<PlaceComponent> {
  @override
  Widget build(BuildContext context) {

    var fuelType = 'SP95';
    switch(widget.fuelType) {
      case 0:
        fuelType = 'SP95';
        break;
      case 1:
        fuelType = 'SP98';
        break;
      case 2:
        fuelType = 'E10';
        break;
      case 3:
        fuelType = 'E85';
        break;
      case 4:
        fuelType = 'Gazole';
        break;
      case 5:
        fuelType = 'GPLc';
        break;
    }

    var price = 'N/A';
    var totalPrice = 'N/A';
    for (var gazPrice in widget.gazStation.gazPrices) {
      if (gazPrice.fuelType == fuelType) {
        price = gazPrice.price.toString() + '€';
        totalPrice = (gazPrice.price * User.vehicule?.getReservoir()).toStringAsFixed(3) + '€';
      }
    }

    fuelType += ':';

    return GestureDetector(
      onTap: () async {
        Position position = await GeolocatorPosition.determinePosition();

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(gazStation: widget.gazStation, position: position),
          ),
        );
      },
      child: Container(
        color: ColorManager.invisible,
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
                        widget.gazStation.name == 'Inconnue' ? widget.gazStation.address : widget.gazStation.name,
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
                            children: [
                              Text(
                                fuelType,
                                style: const TextStyle(
                                  color: ColorManager.secondary,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Text(
                                price,
                                style: const TextStyle(
                                  color: ColorManager.primary,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              const Text(
                                '-',
                                style: TextStyle(
                                  color: ColorManager.secondary,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Text(
                                totalPrice,
                                style: const TextStyle(
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
      ),
    );
  }
}
