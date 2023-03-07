import 'dart:convert';

import 'package:http/http.dart' as http;

class QueryApi
{
  static final QueryApi _instance = QueryApi._internal();

  factory QueryApi() => _instance;

  QueryApi._internal();

  static register(String firstName, String lastName, String email, String password) async
  {
    await http.post(Uri.parse('http://cartools.test/register'), body: {
      'firstname': 'zefzf',
      'lastname': 'zefzf',
      'email': 'zefzf@gmail.com',
      'password': 'password',
      'password_confirmation': 'password',
    });
  }

  static login(String email, String password) async
  {
    final response = await http.post(Uri.parse('http://cartools.test/login'), body: {
      'email': 'zefzf@gmail.com',
      'password': 'password',
    });
  }
}