import 'package:flutter/cupertino.dart';

class FilterProvider extends ChangeNotifier {
  void saveFilter() {
    notifyListeners();
  }
}