import 'package:flutter/cupertino.dart';

class FilterProvider extends ChangeNotifier {
  int _radius = 0;
  int _fuelType = 0;

  get radius => _radius;
  get fuelType => _fuelType;

  void setRadius(int radius) {
    _radius = radius;
    notifyListeners();
  }

  void setFuelType(int fuelType) {
    _fuelType = fuelType;
    notifyListeners();
  }
}