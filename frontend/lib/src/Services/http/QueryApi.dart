import 'dart:convert';

import 'package:frontend/src/Db/model/GazStation.dart';
import 'package:frontend/src/Db/model/User.dart';
import 'package:frontend/src/Db/model/Vehicule.dart';
import 'package:frontend/src/Db/repository/GazStationRepository.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class QueryApi
{
  static final QueryApi _instance = QueryApi._internal();

  factory QueryApi() => _instance;

  QueryApi._internal();

  static Future<bool> register(String firstName, String lastName, String email, String password, String passwordConfirmation) async
  {
    final response = await http.post(Uri.parse('http://cartools.test/api/register'), body: {
      'firstname': firstName,
      'lastname': lastName,
      'email': email,
      'password': password,
      'password_confirmation': passwordConfirmation,
    });
    if (response.statusCode == 201) {

      var token = json.decode(response.body)['token'];

      final prefs = await SharedPreferences.getInstance();
      prefs.setString('token', token);

      return true;
    } else {
      return false;
    }
  }

  static Future<bool> login(String email, String password) async
  {
    final response = await http.post(Uri.parse('http://cartools.test/api/login'), body: {
      'email': email,
      'password': password,
    });
    if (response.statusCode == 200) {

      var token = json.decode(response.body)['token'];

      final prefs = await SharedPreferences.getInstance();
      prefs.setString('token', token);

      return true;
    } else {
      return false;
    }
  }

  static Future<bool> logout() async
  {
    final response = await http.post(Uri.parse('http://cartools.test/api/logout'),
      headers: {
        'Authorization': 'Bearer ' + (await SharedPreferences.getInstance()).getString('token')!,
      },);
    if (response.statusCode == 200) {

      final prefs = await SharedPreferences.getInstance();
      prefs.remove('token');

      return true;
    } else {
      return false;
    }
  }

  static Future<bool> getUser() async
  {
    final response = await http.get(Uri.parse('http://cartools.test/api/user'),
      headers: {
        'Authorization': 'Bearer ' + (await SharedPreferences.getInstance()).getString('token')!,
      },);
    if (response.statusCode == 200) {

      var data = json.decode(response.body);
      User.fromJson(data);

      return true;
    } else {
      return false;
    }
  }

  static Future<bool> setVehicule() async
  {
    final response = await http.post(Uri.parse('http://cartools.test/api/car'),
      headers: {
        'Authorization': 'Bearer ' + (await SharedPreferences.getInstance()).getString('token')!,
      },
      body: {
        'brand': User.vehicule!.getBrand()!,
        'model': User.vehicule!.getModel()!,
        'reservoir': User.vehicule!.getReservoir()!.toString(),
        'consumption': User.vehicule!.getConsumption()!.toString(),
      },
    );
    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> getVehicule() async
  {
    final response = await http.get(Uri.parse('http://cartools.test/api/car'),
      headers: {
        'Authorization': 'Bearer ' + (await SharedPreferences.getInstance()).getString('token')!,
      },);
    if (response.statusCode == 200) {

      var data = json.decode(response.body);
      User.vehicule = Vehicule.fromJson(data);

      return true;
    } else {
      return false;
    }
  }

  static Future<bool> getGazStations() async
  {
    final response = await http.get(Uri.parse('http://cartools.test/api/gaz-stations'),
      headers: {
        'Authorization': 'Bearer ' + (await SharedPreferences.getInstance()).getString('token')!,
      },);
    if (response.statusCode == 200) {

      var data = json.decode(response.body);
      GazStationRepository.gazStations.clear();
      for (var gazStation in data['data']) {
        GazStationRepository.gazStations.add(GazStation.fromJson(gazStation));
      }

      return true;
    } else {
      return false;
    }
  }
}