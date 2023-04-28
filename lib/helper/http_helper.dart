import 'dart:convert';

import 'package:budget_planner_app/constants/endpoint.dart';
import 'package:http/http.dart' as http;

class Http {
  static Future postData({
    required String email,
    required String password,
  }) async {
    Uri uri = Uri.parse(Endpoint.login);
    print("before @@@@@@@@@@@@@@@@@");
    var response = await http.post(
      uri,
      body: {"email": email, "password": password},
    );
        print("after22222 @@@@@@@@@@@@@@@@@");

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      print("after @@@@@@@@@@@@@@@@@");
      print(jsonResponse);
      return jsonResponse;
    } else {
      throw Exception('Failed to Login.');
    }
    
  }
}
