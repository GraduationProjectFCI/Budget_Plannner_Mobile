import 'package:budget_planner_app/constants/app_routes.dart';
import 'package:budget_planner_app/constants/endpoint.dart';
import 'package:budget_planner_app/controller/sheets_controller.dart';
import 'package:budget_planner_app/helper/cashe_helper.dart';
import 'package:budget_planner_app/helper/http_helper.dart';
import 'package:budget_planner_app/model/sheet_model.dart';
import 'package:budget_planner_app/view/widgets/toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../functions/refresh_data.dart';
import '../model/expenses_model.dart';

class sheetInfoController extends GetxController {
  // sheetsController conttrollrerSheet = Get.put(sheetsController());
  TextEditingController valueController = TextEditingController();
  TextEditingController descrController = TextEditingController();
  TextEditingController labelController = TextEditingController();

  var formkey = GlobalKey<FormState>();
  bool deleteestate = true;

  late ExpensesModel model;
  bool state = true;
  bool addstate = true;
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

  Future<void> addLabel() async {
    if (formkey.currentState!.validate()) {
      addstate = false;
      update();
      Map<String, dynamic> data = {
        "label": labelController.text,
        "description": descrController.text,
        "value": int.parse(valueController.text),
      };
      var sheetId = CacheHelper.prefs?.getString("sheetId");
      String? token = CacheHelper.prefs?.getString("token");
      Http.postData(
              endpoint: '${Endpoint.sheetData}/$sheetId',
              token: token,
              map: data)
          .then((value1) {
        refrishData().then((value) {
          getSheetExpense(sheetId: sheetId!).then((value) {
            addstate = true;
            valueController.clear();
            descrController.clear();
            update();
          });
        });
        update();

        print("sheet id!!!! $sheetId");
      });
    }
  }

  Future deleteSheet({
    required String? sheetId,
  }) async {
    deletestate = false;
    update();

    String? token = CacheHelper.prefs!.getString('token');
    await Http.delete(url: '${Endpoint.sheetData}/$sheetId', token: token!)
        .then((value) {
      refrishData().then((value) {
        sheetsController().getSheetData().then((value) {
          Get.back();
          deletestate = true;
          update();
        });
      });

      toast(msg: "${value['msg']}", color: Color.fromARGB(255, 3, 216, 244));
    });
  }

  void deleteExpense({
    required String expenseId,
  }) {
    deleteestate = false;
    String? token = CacheHelper.prefs!.getString('token');
    String? sheetId = CacheHelper.prefs!.getString('sheetId');
    Http.delete(url: '${Endpoint.sheetData}/$sheetId/$expenseId', token: token!)
        .then((value) {
      toast(msg: "${value['msg']}", color: Color.fromARGB(255, 3, 216, 244));
      sheetsController().getSheetData().then((value) {
        getSheetExpense(sheetId: sheetId!).then((value) {
          deleteestate = true;
        });
      });
    });
  }
}
//6464b2dce54e27ed81f5ff92
//6464b2dce54e27ed81f5ff92