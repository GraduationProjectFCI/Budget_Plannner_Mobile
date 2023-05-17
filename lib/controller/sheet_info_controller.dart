import 'package:budget_planner_app/constants/app_routes.dart';
import 'package:budget_planner_app/constants/endpoint.dart';
import 'package:budget_planner_app/controller/sheets_controller.dart';
import 'package:budget_planner_app/helper/cashe_helper.dart';
import 'package:budget_planner_app/helper/http_helper.dart';
import 'package:budget_planner_app/model/sheet_model.dart';
import 'package:budget_planner_app/view/widgets/toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/expenses_model.dart';

class sheetInfoController extends GetxController {
  sheetsController conttrollrerSheet = Get.put(sheetsController());

  late ExpensesModel model;
  bool state = true;
  bool deletestate = true;
  Future<void> getSheetExpense({
    required String sheetId,
  }) async {
    state = false;
    String? token = CacheHelper.prefs!.getString('token');
    Http.getData(token: token, url: '${Endpoint.sheetData}/$sheetId')
        .then((value) {
      model = ExpensesModel.fromJson(value);
      
      state = true;
      update();
    });
    update();
  }

  void deleteSheet({
    required String sheetId,
  }) {
    deletestate = false;
    String? token = CacheHelper.prefs!.getString('token');
    Http.delete(url: '${Endpoint.sheetData}/$sheetId', token: token!)
        .then((value) {
      deletestate = true;
      toast(msg: "${value['msg']}", color: Color.fromARGB(255, 3, 216, 244));
      conttrollrerSheet.getSheetData().then((value) {
        Get.back();
      });
    });
  }
}
