import 'dart:convert';

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
}