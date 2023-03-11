class Vehicule
{
  static final Vehicule _instance = Vehicule._internal();

  factory Vehicule() => _instance;

  Vehicule._internal();

  factory Vehicule.fromJson(Map<String, dynamic> json) {
    return _instance;
  }
}