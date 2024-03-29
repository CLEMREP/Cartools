import 'package:frontend/src/Db/model/GazPrice.dart';

class GazStation
{
  int stationId;
  double latitude;
  double longitude;
  String brand;
  String name;
  String postalCode;
  String city;
  String address;
  String pop;
  List<GazPrice> gazPrices = [];

  GazStation({
    required this.stationId,
    required this.latitude,
    required this.longitude,
    required this.brand,
    required this.name,
    required this.postalCode,
    required this.city,
    required this.address,
    required this.pop,
  });

  factory GazStation.fromJson(Map<String, dynamic> json) {
    return GazStation(
      stationId: json['station_id'],
      latitude: double.parse(json['latitude'].toString()) / 100000,
      longitude: double.parse(json['longitude'].toString()) / 100000,
      brand: json['brand'] ?? 'Inconnue',
      name: json['name'] ?? 'Inconnue',
      postalCode: json['postal_code'],
      city: json['city'],
      address: json['address'],
      pop: json['pop'],
    );
  }
}