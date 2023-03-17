import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:frontend/src/Db/repository/GazStationRepository.dart';
import 'package:frontend/src/Services/ColorManager.dart';
import 'package:frontend/src/Services/Providers/FilterProvider.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  var stations = [];
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Consumer<FilterProvider>(
        builder: (context, filter, child) {
          return FutureBuilder(
            future: GazStationRepository.getStationsFilter(filter),
            builder: (context, AsyncSnapshot<List> snapshot) {
              MapController mapController = MapController();
              if (snapshot.hasData) {
                return FlutterMap(
                  mapController: mapController,
                  options: MapOptions(
                    onPositionChanged: (tapPosition, point) => {
                      print(mapController.zoom),
                    },
                    onPointerUp: (tapPosition, point) => {
                      if(mapController.zoom >= 12) {
                        setState(() {
                          stations = snapshot.data!;
                        }),
                      } else {
                        setState(() {
                          stations = [];
                        }),
                      }
                    },
                    center: LatLng(2, 40),
                    //zoom: 13.0,
                    zoom: 5.0,
                  ),
                  children: [
                    TileLayer(
                      urlTemplate: "https://api.mapbox.com/styles/v1/mapbox/light-v10/tiles/{z}/{x}/{y}?access_token={accessToken}",
                      additionalOptions: {
                        'accessToken': "pk.eyJ1IjoibW9qbWlsbyIsImEiOiJja3Nlc295YmExM25lMnZtYzhsMnpzamd3In0.2zqTJpHL6B7VUIlPyqGdIw",
                      },
                    ),
                    MarkerLayer(
                      markers: [
                        for(var gazStation in stations!)
                          Marker(
                            width: 45,
                            height: 45,
                            point: LatLng(gazStation.latitude, gazStation.longitude),
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
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          );
        },
      ),
    );
  }
}
