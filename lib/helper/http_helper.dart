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

  static register({
    required String name,
    required String email,
    required String password,
    required String gender,
    required String age,
    required String budget,
    required String currency,
    required String birthdate,
  }) async {
    Map data = {
      "name": name,
      "password": password,
      "email": email,
      "gender": gender,
      "age": age,
      "budget": budget,
      "currency": currency,
      "birthdate": birthdate
    };
    print(data);
    String body = json.encode(data);
    print(body);
    var url = Uri.parse(Endpoint.register);
    var response = await http.post(
      url,
      body: body,
      headers: {
        "Content-Type": "application/json",
        "accept": "application/json",
        "Access-Control-Allow-Origin": "*"
      },
    );
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      //Or put here your next screen using Navigator.push() method
      print('success');
      return response.body;
    } else if (response.statusCode == 400) {
      print('${response.body}');
      return response.body;
      /*
      {"status":400,"msg":["this email is registered"]}
      */
    } else {
      print('${response.body}');
      return response.body;
    }
  }

  static confirmation({
    required String userId,
    required String code,
  }) async {
    Map data = {
      "user_id": userId,
      "code": code,
    };
    print(data);
    String body = json.encode(data);
    print(body);
    var url = Uri.parse(Endpoint.confirmation);
    var response = await http.post(
      url,
      body: body,
      headers: {
        "Content-Type": "application/json",
        "accept": "application/json",
        "Access-Control-Allow-Origin": "*"
      },
    );
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      //Or put here your next screen using Navigator.push() method
      print('success');
      return response.body;
    } else {
      print('${response.body}');
      return response.body;
    }
  }
}
