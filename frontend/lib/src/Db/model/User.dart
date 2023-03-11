import 'package:frontend/src/Db/model/Vehicule.dart';

class User
{
  static String? firstname;
  static String? lastname;
  static String? email;
  static Vehicule? vehicule;

  static final User _instance = User._internal();

  factory User() => _instance;

  User._internal();

  factory User.fromJson(Map<String, dynamic> json) {
    User.firstname = json['firstname'];
    User.lastname = json['lastname'];
    User.email = json['email'];
    User.vehicule = json['car'] == null ? null : Vehicule.fromJson(json['car']);
    return _instance;
  }
}