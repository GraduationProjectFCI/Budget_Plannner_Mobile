import 'dart:convert';

import 'package:budget_planner_app/constants/endpoint.dart';
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
    
      var jsonResponse =await jsonDecode(response.body);
      
      return jsonResponse;
      //Or put here your next screen using Navigator.push() method
      print('success');
   
  }
}
