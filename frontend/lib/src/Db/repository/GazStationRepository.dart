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

    if(filter.isStarted) {
      final prefs = await SharedPreferences.getInstance();

      filter.setFuelType(prefs.getInt('fuelType') ?? 0);
      filter.setRadius(prefs.getInt('radius') ?? 0);
      filter.setIsOrder(prefs.getBool('order') ?? false);
      filter.setIsStarted(false);
    }

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

    double latitude = 0;
    double longitude = 0;

    if(filter.location == null) {
      try {
        Position position = await GeolocatorPosition.determinePosition();
        if(position == null) {
          return stations;
        } else {
          latitude = position.latitude;
          longitude = position.longitude;
        }
      } catch (e) {
        return stations;
      }
    } else {
      latitude = filter.location!.latitude;
      longitude = filter.location!.longitude;
    }

    for(GazStation gazStation in gazStations) {

      double distance = 0;

      if(lat != 0 && lon != 0) {
        distance = Geolocator.distanceBetween(lat, lon, gazStation.latitude, gazStation.longitude);
      } else {
        distance = Geolocator.distanceBetween(latitude, longitude, gazStation.latitude, gazStation.longitude);
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

    if(filter.isOrder) {
      stations.sort((a, b) {
        var priceA = 0.0;
        var priceB = 0.0;
        for(var gazPrice in a.gazPrices) {
          if (gazPrice.fuelType == fuelType) {
            priceA = gazPrice.price;
          }
        }
        for(var gazPrice in b.gazPrices) {
          if (gazPrice.fuelType == fuelType) {
            priceB = gazPrice.price;
          }
        }
        return priceA.compareTo(priceB);
      });
    } else {
      stations.sort((a, b) {
        var distanceA = Geolocator.distanceBetween(latitude, longitude, a.latitude, a.longitude);
        var distanceB = Geolocator.distanceBetween(latitude, longitude, b.latitude, b.longitude);
        return distanceA.compareTo(distanceB);
      });
    }

    return stations;
  }

  static Future<Map> getStationsMap(filter, double lat, double lon, int radius) async
  {
    if(filter.location == null) {
      try {
        Position position = await GeolocatorPosition.determinePosition();
        if(position == null) {
          return {
            'stations': [],
            'position': null,
          };
        } else {
          return {
            'stations': await getStationsFilter(filter, lat, lon, radius),
            'position': position,
          };
        }
      } catch (e) {
        return {
          'stations': [],
          'position': null,
        };
      }
    } else {
      return {
        'stations': await getStationsFilter(filter, lat, lon, radius),
        'position': filter.location,
      };
    }
  }
}