import 'package:budget_planner_app/model/login_model.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

import '../helper/http_helper.dart';

class LoginController extends GetxController {
  LoginInfo? loginModel;
  RxBool state = true.obs;
  var val;
  onSubmit({
    required String email,
    required String password,
  }) async {
    state = false.obs;
    Http.login(email: email, password: password).then((value) async {
      WidgetsFlutterBinding.ensureInitialized();
      print("value @@@@ $value");
      print("massage !!!!${value['msg']}");
      loginModel = await LoginInfo.fromjson(value);
      // print(loginModel?.message);
      // print(loginModel.message);
      // print(loginModel.message);
      // print(loginModel.message);
      state = true.obs;

      update();
    }).catchError((error) {
      print(error.toString());
    });
    ;
    update();
  }
}
