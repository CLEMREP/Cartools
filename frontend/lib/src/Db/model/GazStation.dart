class GazStation
{
  int stationId;
  int latitude;
  int longitude;
  String postalCode;
  String city;
  String address;
  String pop;

  GazStation({
    required this.stationId,
    required this.latitude,
    required this.longitude,
    required this.postalCode,
    required this.city,
    required this.address,
    required this.pop,
  });

  factory GazStation.fromJson(Map<String, dynamic> json) {
    return GazStation(
      stationId: json['station_id'],
      latitude: int.parse(json['latitude'].toString()),
      longitude: json['longitude'],
      postalCode: json['postal_code'],
      city: json['city'],
      address: json['address'],
      pop: json['pop'],
    );
  }
}