import 'package:budget_planner_app/constants/endpoint.dart';
import 'package:budget_planner_app/helper/cashe_helper.dart';
import 'package:budget_planner_app/models/home_model.dart';
import 'package:budget_planner_app/models/limits_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../helper/http_helper.dart';

class HomeController extends GetxController {
  RxBool state = true.obs;
  HomeModel? homeModel;
  Future<void> getHomeData() async {
    print('helllllo Home');
    state = false.obs;
    Http.getHomeData(
            endPoints: Endpoint.homeData,
            token: CacheHelper.prefs!.getString('token').toString())
        .then((value) {
      print('sucess');
      print('Home controllrer = $value');
      homeModel = HomeModel.fromJson(value);
      state = true.obs;
      WidgetsFlutterBinding.ensureInitialized();
      update();
    });

    update();
  }

  RxBool state2 = true.obs;
  LimitsModel? limitsModel;
  Future<void> getLimitsData() async {
    print('helllllo getLimitsData');
    state2 = false.obs;
    Http.getHomeData(
            endPoints: Endpoint.limits,
            token: CacheHelper.prefs!.getString('token').toString())
        .then((value) {
      print('sucess');
      print('limits controllrer = $value');
      limitsModel = LimitsModel.fromJson(value);
      print(' @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@\n\n\n\n${limitsModel}');
      state2 = true.obs;
      WidgetsFlutterBinding.ensureInitialized();
      update();
    });

    update();
  }

  @override
  void onInit() {
    getLimitsData();
    getHomeData();

    super.onInit();
  }
}
