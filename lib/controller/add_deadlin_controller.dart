import 'package:budget_planner_app/constants/endpoint.dart';
import 'package:budget_planner_app/controller/deadline_controller.dart';
import 'package:budget_planner_app/helper/cashe_helper.dart';
import 'package:budget_planner_app/helper/http_helper.dart';
import 'package:budget_planner_app/model/deadline_model.dart';
import 'package:budget_planner_app/view/widgets/toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddDeadlineController extends GetxController {
  bool state = true;

  
  TextEditingController dateTimeController = TextEditingController();
  TextEditingController deadlineController = TextEditingController();
  TextEditingController valueController = TextEditingController();
   DeadlineController conttrollrerDeadline = Get.put(DeadlineController());
  
  Future< void> sendData({
    required String name,
    required String date,
    required int value,
  }) async {
    state = false;
    Map<String,dynamic> data = {
      "deadline_name": name,
      "deadline_date": date,
      "deadline_value": value
    };

    String? token = CacheHelper.prefs!.getString('token');
    Http.postData(endpoint: Endpoint.deadlinePost, token: token,map: data).then((value) {
      toast(msg: value['msg']);
      state = true;
      valueController.clear();
      deadlineController.clear();
      dateTimeController.clear();
      conttrollrerDeadline.getDeadlineData();
      Get.back();

      update();
    });
    update();
  }
}
