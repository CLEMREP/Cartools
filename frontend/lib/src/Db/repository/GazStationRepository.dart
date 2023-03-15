import 'package:frontend/src/Db/model/GazStation.dart';
import 'package:frontend/src/Services/GeolocatorPosition.dart';
import 'package:frontend/src/Views/component/ChoiceRadiusComponent.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GazStationRepository
{
  static final List<GazStation> gazStations = [];

  static final GazStationRepository _instance = GazStationRepository._internal();

  factory GazStationRepository() => _instance;

  GazStationRepository._internal();

  static void add(GazStation gazStation)
  {
    gazStations.add(gazStation);
  }

  static Future<List<GazStation>> getStationsZone(double zone) async
  {
    List<GazStation> stations = [];

    Position position = await GeolocatorPosition.determinePosition();

    for(GazStation gazStation in gazStations) {
      double distance = Geolocator.distanceBetween(position.latitude, position.longitude, gazStation.latitude, gazStation.longitude);
      if (distance / 1000 <= zone) {
        stations.add(gazStation);
      }
    }

    return stations;
  }

  static Future<List<GazStation>> getStationsFilter() async
  {
    List<GazStation> stations = [];

    var radius = 0;

    switch(ChoiceRadiusComponent.selectedIndexChoiceRadiusComponent) {
      case 0:
        radius = 1;
        break;
      case 1:
        radius = 5;
        break;
      case 2:
        radius = 20;
        break;
      case 3:
        radius = (50);
        break;
    }

    if(radius == null) {
      radius = 1;
    }

    Position position = await GeolocatorPosition.determinePosition();

    for(GazStation gazStation in gazStations) {
      double distance = Geolocator.distanceBetween(position.latitude, position.longitude, gazStation.latitude, gazStation.longitude);
      if (distance / 1000 <= double.parse(radius.toString())) {
        stations.add(gazStation);
      }
    }

    return stations;
  }
}