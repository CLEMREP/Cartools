import 'dart:convert';

import 'package:http/http.dart' as http;

class QueryApi
{
  static final QueryApi _instance = QueryApi._internal();

  factory QueryApi() => _instance;

  QueryApi._internal();

  static getCsrfToken() async
  {
    await http.get(Uri.parse('http://cartools.test/sanctum/csrf-cookie'));
  }

  static register() async
  {
    await getCsrfToken();
    final response = await http.post(Uri.parse('http://cartools.test/register'), body: {
      'firstname': 'zefzf',
      'lastname': 'zefzf',
      'email': 'zefzf@gmail.com',
      'password': 'password',
    });
    print(response.body);
  }
}