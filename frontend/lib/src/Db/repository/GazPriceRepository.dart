import 'package:frontend/src/Db/model/GazPrice.dart';

class GazPriceRepository
{
  static final List<GazPrice> gazPrices = [];

  static final GazPriceRepository _instance = GazPriceRepository._internal();

  factory GazPriceRepository() => _instance;

  GazPriceRepository._internal();

  static void add(GazPrice gazPrice)
  {
    gazPrices.add(gazPrice);
  }
}