import 'package:flutter/material.dart';
import 'package:frontend/src/Db/model/GazStation.dart';
import 'package:frontend/src/Db/repository/GazStationRepository.dart';
import 'package:frontend/src/Services/ColorManager.dart';
import 'package:geolocator/geolocator.dart';

class DetailPage extends StatefulWidget {
  final GazStation gazStation;
  final Position position;

  const DetailPage({Key? key, required GazStation this.gazStation, required this.position}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 50, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      decoration: const BoxDecoration(
                        color: ColorManager.secondary,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: const Icon(
                        Icons.arrow_back,
                        color: ColorManager.thirdly,
                      ),
                    ),
                  ),
                  const Text('Détails de la station',
                    style: TextStyle(
                      color: ColorManager.secondary,
                      fontSize: 16,
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        height: 270,
                        decoration: const BoxDecoration(
                          color: ColorManager.secondary50,
                          borderRadius: BorderRadius.all(
                            Radius.circular(40),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        color: ColorManager.invisible,
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: Row(
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
                                      Container(
                                        child: Row(
                                            children: [
                                              const Text(
                                                'Distance:',
                                                style: TextStyle(
                                                  color: ColorManager.secondary,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14,
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 8,
                                              ),
                                              Text(
                                                GazStationRepository.getDistance(widget.position.latitude, widget.position.longitude, widget.gazStation.latitude, widget.gazStation.longitude).toStringAsFixed(1) + ' km',
                                                style: const TextStyle(
                                                  color: ColorManager.primary,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ]
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 6,
                                      ),
                                      Container(
                                        child: Text(
                                          widget.gazStation.address,
                                          style: const TextStyle(
                                            color: ColorManager.secondary,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: Row(
                          children: [
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Carburants',
                                    style: TextStyle(
                                      color: ColorManager.secondary,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  Text('Liste des carburants disponibles',
                                    style: TextStyle(
                                      color: ColorManager.secondary,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: Row(
                          children: [
                            Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    for(var gazPrice in widget.gazStation.gazPrices) Container(
                                      margin: const EdgeInsets.symmetric(vertical: 5),
                                      child: Row(
                                        children: [
                                          Text(gazPrice.fuelType + ':',
                                            style: const TextStyle(
                                              color: ColorManager.secondary,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 8,
                                          ),
                                          Text(gazPrice.price + ' €',
                                            style: const TextStyle(
                                              color: ColorManager.primary,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 8,
                                          ),
                                          Text(
                                            ' - ' + gazPrice.lastUpdate.day.toString() + ' / ' + gazPrice.lastUpdate.month.toString() + ' / ' + gazPrice.lastUpdate.year.toString(),
                                            style: const TextStyle(
                                              color: ColorManager.secondary,
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: Row(
                            children: [
                              Text(
                                widget.gazStation.city + ':',
                                style: TextStyle(
                                  color: ColorManager.secondary,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Text(
                                widget.gazStation.postalCode,
                                style: const TextStyle(
                                  color: ColorManager.primary,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ]
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                )
              ),
            ),
            GestureDetector(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 20),
                decoration: const BoxDecoration(
                  color: ColorManager.secondary,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Center(
                  child: Text('Voir sur la carte',
                    style: const TextStyle(
                      color: ColorManager.thirdly,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
