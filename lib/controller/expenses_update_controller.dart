import 'package:budget_planner_app/constants/app_routes.dart';
import 'package:budget_planner_app/constants/endpoint.dart';
import 'package:budget_planner_app/controller/sheet_info_controller.dart';
import 'package:budget_planner_app/controller/sheets_controller.dart';
import 'package:budget_planner_app/helper/cashe_helper.dart';
import 'package:budget_planner_app/helper/http_helper.dart';
import 'package:budget_planner_app/view/widgets/toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateExpenseController extends GetxController {
  bool state = true;

  TextEditingController labelController = TextEditingController();
  TextEditingController descrpionController = TextEditingController();
  TextEditingController valueController = TextEditingController();
  sheetInfoController conttrollrerExpense = Get.put(sheetInfoController());
  sheetsController conttrollrerSheet = Get.put(sheetsController());
  var formkey = GlobalKey<FormState>();

  void deleteExpense({
    required String expenseId,
  }) {
    String? token = CacheHelper.prefs!.getString('token');
    String? sheetId = CacheHelper.prefs!.getString('sheetId');
    Http.delete(url: '${Endpoint.sheetData}/$sheetId/$expenseId', token: token!)
        .then((value) {
      toast(msg: "${value['msg']}", color: Color.fromARGB(255, 3, 216, 244));

      conttrollrerSheet.getSheetData().then((value) {
        conttrollrerExpense.getSheetExpense(sheetId: sheetId!).then((value) {
          Get.offAllNamed(AppRoutes.bottomNavigationBar);
          Get.toNamed(AppRoutes.sheetInfo, arguments: sheetId);

        });
      });
    });
  }

  Future<void> updatExpense({
    required String label,
    String? description,
    required int value,
    required String expenseId,
  }) async {
    if (formkey.currentState!.validate()) {
      state = false;
      Map<String, dynamic> data = {
        "label": label,
        "description": description,
        "value": value
      };

      String? token = CacheHelper.prefs!.getString('token');
      String? sheetId = CacheHelper.prefs!.getString('sheetId');
      Http.updateData(
              endpoint: "${Endpoint.sheetData}/$sheetId/$expenseId",
              token: token,
              map: data)
          .then((value) {
        toast(msg: value['msg'], color: Colors.green);
        state = true;
        valueController.clear();
        labelController.clear();
        descrpionController.clear();

        conttrollrerSheet.getSheetData().then((value) {
          conttrollrerExpense.getSheetExpense(sheetId: sheetId!);
        });

        update();
      });
      update();
    }
  }
}
