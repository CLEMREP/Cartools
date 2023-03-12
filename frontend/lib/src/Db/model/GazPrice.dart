import 'package:frontend/src/Db/model/GazStation.dart';

class GazPrice
{
  String fuelType;
  String price;
  DateTime lastUpdate;
  GazStation gazStation;

  GazPrice({
    required this.fuelType,
    required this.price,
    required this.lastUpdate,
    required this.gazStation,
  });

  factory GazPrice.fromJson(Map<String, dynamic> json, GazStation gazStation) {
    return GazPrice(
      fuelType: json['fuel_type'],
      price: json['price'],
      lastUpdate: DateTime.parse(json['last_update']),
      gazStation: gazStation,
    );
  }
}