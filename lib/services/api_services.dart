// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiServices {
  Future testApiConnect() async {
    const newApiUrl = 'https://newsapi.org/v2/everything?' +
        'q=Apple&' +
        'from=2022-02-03&' +
        'sortBy=popularity&' +
        'apiKey=38970fc426234d6493f338e9183e6334';
    final testApiUrl = Uri.parse(newApiUrl);
    final response = await http.get(testApiUrl);
    // print(response.statusCode);
    // print(response.body);
    return json.decode(response.body);
  }
}
