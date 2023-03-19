import 'package:flutter/cupertino.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class FilterProvider extends ChangeNotifier {
  bool _isSarted = true;
  int _radius = 0;
  int _fuelType = 0;
  bool _isOrder = false; // false = position, true = price
  Location? _location;
  String _address = '';

  get radius => _radius;
  get fuelType => _fuelType;
  get isOrder => _isOrder;
  get isStarted => _isSarted;
  get location => _location;
  get address => _address;

  void setRadius(int radius) {
    _radius = radius;
    notifyListeners();
  }

  void setFuelType(int fuelType) {
    _fuelType = fuelType;
    notifyListeners();
  }

  void setIsOrder(bool isOrder) {
    _isOrder = isOrder;
    notifyListeners();
  }

  void setIsStarted(bool isStarted) {
    _isSarted = isStarted;
    notifyListeners();
  }

  void setLocation(Location? location) {
    _location = location;
    notifyListeners();
  }

  void setAddress(String address) {
    _address = address;
    notifyListeners();
  }
}