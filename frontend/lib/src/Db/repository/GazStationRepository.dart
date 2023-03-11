import 'package:frontend/src/Db/model/GazStation.dart';

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

  static List<GazStation> getStationsZone(double zone)
  {
    List<GazStation> stations = [];

    for(GazStation gazStation in gazStations) {
      // faire le système de zone
    }

    return stations;
  }
}