import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:frontend/src/Db/repository/GazStationRepository.dart';
import 'package:frontend/src/Services/ColorManager.dart';
import 'package:frontend/src/Services/Providers/FilterProvider.dart';
import 'package:frontend/src/Views/page/DetailPage.dart';
import 'package:frontend/src/Views/page/StationPage.dart';
import 'package:geolocator/geolocator.dart';
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
  double latitude = 0;
  double longitude = 0;
  int radius = 10;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            child: Expanded(
              child: Consumer<FilterProvider>(
                builder: (context, filter, child) {
                  return FutureBuilder(
                    future: GazStationRepository.getStationsMap(filter, latitude, longitude, radius),
                    builder: (context, AsyncSnapshot<Map> snapshot) {
                      MapController mapController = MapController();
                      if (snapshot.hasData) {
                        return FlutterMap(
                          mapController: mapController,
                          options: MapOptions(
                            onMapReady: () => {
                              setState(() {
                                stations = snapshot.data!['stations'];
                              }),
                            },
                            onPositionChanged: (tapPosition, point) => {
                              setState(() {
                                latitude = mapController.center.latitude;
                                longitude = mapController.center.longitude;
                              }),
                            },
                            onPointerUp: (tapPosition, point) => {
                              if(mapController.zoom >= 12) {
                                setState(() {
                                  stations = snapshot.data!['stations'];
                                }),
                              } else {
                                setState(() {
                                  stations = [];
                                }),
                              }
                            },
                            center: LatLng(snapshot.data!['position'].latitude, snapshot.data!['position'].longitude),
                            zoom: 12.0,
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
                                for(var gazStation in stations!)
                                  Marker(
                                    width: 45,
                                    height: 45,
                                    point: LatLng(gazStation.latitude, gazStation.longitude),
                                    builder: (ctx) => GestureDetector(
                                      onTap: () => {
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(gazStation: gazStation, position: snapshot.data!['position']))),
                                      },
                                      child: Container(
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
            ),
          ),
        ],
      ),
    );
  }
}
