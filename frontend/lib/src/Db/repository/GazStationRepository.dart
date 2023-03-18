import 'package:frontend/src/Db/model/GazStation.dart';
import 'package:frontend/src/Services/GeolocatorPosition.dart';
import 'package:frontend/src/Services/Providers/FilterProvider.dart';
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

  static getDistance(double lat1, double lon1, double lat2, double lon2)
  {
    double distance = Geolocator.distanceBetween(lat1, lon1, lat2, lon2);

    return distance / 1000;
  }

  static Future<List<GazStation>> getStationsFilter(FilterProvider filter, double lat, double lon, int rad) async
  {
    List<GazStation> stations = [];

    var radius = 1;
    switch(filter.radius) {
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

    var fuelType = 'SP95';
    switch(filter.fuelType) {
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

    Position position = await GeolocatorPosition.determinePosition();

    for(GazStation gazStation in gazStations) {

      double distance = 0;

      if(lat != 0 && lon != 0) {
        distance = Geolocator.distanceBetween(lat, lon, gazStation.latitude, gazStation.longitude);
      } else {
        distance = Geolocator.distanceBetween(position.latitude, position.longitude, gazStation.latitude, gazStation.longitude);
      }

      if(rad != 0) {
        radius = rad;
      }

      if (distance / 1000 <= double.parse(radius.toString())) {
        for(var gazPrice in gazStation.gazPrices) {
          if (gazPrice.fuelType == fuelType) {
            stations.add(gazStation);
          }
        }
      }
    }

    return stations;
  }

  static Future<Map> getStationsMap(filter, double lat, double lon, int radius) async
  {
    Position position = await GeolocatorPosition.determinePosition();
    double latitude = position.latitude;
    double longitude = position.longitude;
    return {
      'stations': await getStationsFilter(filter, lat, lon, radius),
      'latitude': latitude,
      'longitude': longitude,
    };
  }
}