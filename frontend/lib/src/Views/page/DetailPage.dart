import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:frontend/src/Db/model/GazStation.dart';
import 'package:frontend/src/Db/repository/GazStationRepository.dart';
import 'package:frontend/src/Services/ColorManager.dart';
import 'package:frontend/src/Views/component/ButtonGoMapComponent.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

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
                  SizedBox(
                      width: 20
                  ),
                  Text(
                    widget.gazStation.name == 'Inconnue' ? 'Détails de la station' : widget.gazStation.name,
                    style: const TextStyle(
                      color: ColorManager.secondary,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
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
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.all(
                                  Radius.circular(40),
                                ),
                              child: FlutterMap(
                                options: MapOptions(
                                  center: LatLng(widget.gazStation.latitude, widget.gazStation.longitude),
                                  zoom: 15.0,
                                ),
                                children: [
                                  TileLayer(
                                    /* urlTemplate: "https://api.mapbox.com/styles/v1/mapbox/light-v10/tiles/{z}/{x}/{y}?access_token={accessToken}",
                                    additionalOptions: {
                                      'accessToken': "pk.eyJ1IjoibW9qbWlsbyIsImEiOiJja3Nlc295YmExM25lMnZtYzhsMnpzamd3In0.2zqTJpHL6B7VUIlPyqGdIw",
                                    }, */
                                    urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                                  ),
                                  MarkerLayer(
                                    markers: [
                                      Marker(
                                        width: 45,
                                        height: 45,
                                        point: LatLng(widget.gazStation.latitude, widget.gazStation.longitude),
                                        builder: (ctx) => Container(
                                          decoration: BoxDecoration(
                                            color: ColorManager.primary50,
                                            borderRadius: BorderRadius.circular(50),
                                          ),
                                          child: Center(
                                            child: Stack(
                                              children: [
                                                Container(
                                                  width: 20,
                                                  height: 20,
                                                  decoration: BoxDecoration(
                                                    color: ColorManager.thirdly,
                                                    borderRadius: BorderRadius.circular(50),
                                                    border: Border.all(
                                                      color: ColorManager.primary,
                                                      width: 4,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              decoration: const BoxDecoration(
                                color: ColorManager.secondary50,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(40),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        color: ColorManager.invisible,
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
                                              Container(
                                                constraints: const BoxConstraints(
                                                  maxWidth: 125,
                                                ),
                                                child: Text(
                                                  widget.gazStation.city,
                                                  style: const TextStyle(
                                                    color: ColorManager.secondary,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14,
                                                    overflow: TextOverflow.ellipsis,
                                                  ),
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            for(var gazPrice in widget.gazStation.gazPrices) Container(
                              margin: const EdgeInsets.symmetric(vertical: 5),
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: ColorManager.secondary,
                                  width: 2,
                                ),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: ColorManager.secondary,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: const Icon(
                                      Icons.ev_station,
                                      size: 30,
                                      color: ColorManager.thirdly,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          child: Row(
                                            children: [
                                              Text(
                                                gazPrice.fuelType,
                                                style: const TextStyle(
                                                  color: ColorManager.secondary,
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
                                                gazPrice.price.toStringAsFixed(3) + '€',
                                                style: const TextStyle(
                                                  color: ColorManager.primary,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Text('Mise à jour le ${gazPrice.lastUpdate.day}/${gazPrice.lastUpdate.month}/${gazPrice.lastUpdate.year}',
                                          style: const TextStyle(
                                            color: ColorManager.secondary,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
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
                )
              ),
            ),
            ButtonGoMapComponent(latitude: widget.gazStation.latitude, longitude: widget.gazStation.longitude, title: widget.gazStation.name == 'Inconnue' ? widget.gazStation.address : widget.gazStation.name),
          ],
        ),
      ),
    );
  }
}
