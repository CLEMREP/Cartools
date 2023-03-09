import 'dart:convert';

import 'package:http/http.dart' as http;

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
    if (response.statusCode == 204) {
      return true;
    } else {
      return false;
    }
  }
}