import 'package:frontend/src/Db/model/User.dart';

class Vehicule
{
  static String? brand;
  static String? model;
  static int? reservoir;
  static double? consumption;

  static final Vehicule _instance = Vehicule._internal();

  factory Vehicule() => _instance;

  Vehicule._internal();

  factory Vehicule.fromJson(Map<String, dynamic> json) {
    Vehicule.brand = json['brand'];
    Vehicule.model = json['model'];
    Vehicule.reservoir = int.parse(json['reservoir'].toString());
    Vehicule.consumption = double.parse(json['consumption'].toString());
    return _instance;
  }

  getBrand() {
    return Vehicule.brand;
  }

  getModel() {
    return Vehicule.model;
  }

  getReservoir() {
    return Vehicule.reservoir;
  }

  getConsumption() {
    return Vehicule.consumption;
  }
}