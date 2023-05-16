import 'dart:convert';

import 'package:budget_planner_app/constants/app_routes.dart';
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
    print('response body  aaaaaaaa  ${registerData}');
    return registerData;
  }

  static Future confirmation({
    required String code,
    required String userId,
  }) async {
    final data = {'user_id': userId, 'code': code};
    final body = json.encode(data);
    print('encode   $body');
    var url = Uri.parse(Endpoint.confirmation);
    final headers = {'Content-Type': 'application/json'};
    var response = await http.post(url, body: body, headers: headers);

    print('confirm before decode ${response.body}');
    var jsondecode = await jsonDecode(response.body);
    print('confirm after decode ${jsondecode}');
    if (response.statusCode == 200) {
      //Or put here your next screen using Navigator.push() method
      print('success');
      return jsondecode;
    } else {
      print('${response.body}');
      return jsondecode;
    }
  }

  static Future getHomeData({required String token}) async {
    final url = '${Endpoint.homeData}';
    final headers = {'Authorization': 'Bearer $token'};
    final uri = Uri.parse(url);
    final response = await http.get(uri, headers: headers);
    if (response.statusCode == 200) {
      // Handle success
      print('success!!!!');
      print('body = ${response.body}');
      return await jsonDecode(response.body);
    } else {
      print('error');
      print('body = ${jsonDecode(response.body)}');
      // Handle error
    }
  }

  static Future postData({
    required Map<String, dynamic> map,
    required String endpoint,
    String? token,
  }) async {
    print(map);
    String body = json.encode(map);
    print(body);
    var url = Uri.parse(endpoint);
    var response = await http.post(
      url,
      body: body,
      headers: {
        'Authorization': 'Bearer $token',
        "Content-Type": "application/json",
        "accept": "application/json",
        "Access-Control-Allow-Origin": "*"
      },
    );
    print("Http file!!!! ${response.body}");
    print(response.statusCode);

    var jsonResponse = await jsonDecode(response.body);

    return jsonResponse;
  }

  static Future updateData({
    required Map<String, dynamic> map,
    required String endpoint,
    String? token,
  }) async {
    print(map);
    String body = json.encode(map);
    print(body);
    var url = Uri.parse(endpoint);
    var response = await http.patch(
      url,
      body: body,
      headers: {
        'Authorization': 'Bearer $token',
        "Content-Type": "application/json",
        "accept": "application/json",
        "Access-Control-Allow-Origin": "*"
      },
    );
    print("Http file ${response.body}");
    print(response.statusCode);

    var jsonResponse = await jsonDecode(response.body);

    return jsonResponse;
  }

  static Future getData({String? token, required String url}) async {
    final headers = {'Authorization': 'Bearer $token'};

    final uri = Uri.parse(url);
    final response = await http.get(uri, headers: headers);
    if (response.statusCode == 200) {
      print('success!!!!');
      print('body = ${response.body}');
      return await jsonDecode(response.body);
    } else {
      print('error');
      print('body = ${response.body}');
      return await jsonDecode(response.body);
      // Handle error
    }
  }

  static Future delete({required String? token, required String url}) async {
    final headers = {'Authorization': 'Bearer $token'};

    final uri = Uri.parse(url);
    final response = await http.delete(uri, headers: headers);
    if (response.statusCode == 200) {
      // Handle success
      print('success!!!!');
      print('body = ${response.body}');
      return await jsonDecode(response.body);
    } else {
      print('error');
      print('body = ${response.body}');
      print('body = ${jsonDecode(response.body)}');

      return await jsonDecode(response.body);
      // Handle error
    }
  }
}
