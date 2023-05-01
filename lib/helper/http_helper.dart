import 'dart:convert';

import 'package:budget_planner_app/constants/approutes.dart';
import 'package:budget_planner_app/constants/endpoint.dart';
import 'package:budget_planner_app/models/register_model.dart';
import 'package:budget_planner_app/view/widgets/toast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../model/login_model.dart';

class Http {
  // static LoginInfo? loginModel;
  static Future login({
    required String email,
    required String password,
  }) async {
    Map data = {
      "email": email,
      "password": password,
    };
    print(data);

    String body = json.encode(data);
    print(body);
    var url = Uri.parse(Endpoint.login);
    var response = await http.post(
      url,
      body: body,
      headers: {
        "Content-Type": "application/json",
        "accept": "application/json",
        "Access-Control-Allow-Origin": "*"
      },
    );
    print("Http file ${response.body}");
    print(response.statusCode);

    var jsonResponse = await jsonDecode(response.body);

    return jsonResponse;
    //Or put here your next screen using Navigator.push() method
    print('success');
  }

  // static String? userId;
  static Future<Map<String, dynamic>> register({
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
    String body = json.encode(data);
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
    var registerData = await jsonDecode(response.body);

    print(registerData);
    return registerData;
  }

  static Future confirmation({
    required String code,
    required String userId,
    // RegisterModel? modelRegister,
  }) async {
    Map data = {
      "user_id": userId,
      "code": code,
    };

    String body = json.encode(data);
    print('encode   $body');
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

    print('confirm before decode ${response.body}');
    var jsondecode = await jsonDecode(response.body);
    print('confirm after decode ${jsondecode}');
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
