import 'package:frontend/src/Db/model/Vehicule.dart';

class User
{
  static String? token;
  static String? firstname;
  static String? lastname;
  static String? email;
  static Vehicule? vehicule;

  static final User _instance = User._internal();

  factory User() => _instance;

  User._internal();

  factory User.fromJson(Map<String, dynamic> json) {
    User.token = json['token'];
    User.firstname = json['firstname'];
    User.lastname = json['lastname'];
    User.email = json['email'];
    User.vehicule = Vehicule.fromJson(json['vehicule']);
    return _instance;
  }
}