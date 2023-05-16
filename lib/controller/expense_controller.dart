import 'package:budget_planner_app/constants/app_routes.dart';
import 'package:budget_planner_app/constants/endpoint.dart';
import 'package:budget_planner_app/controller/sheets_controller.dart';
import 'package:budget_planner_app/helper/cashe_helper.dart';
import 'package:budget_planner_app/helper/http_helper.dart';
import 'package:budget_planner_app/model/deadline_model.dart';
import 'package:budget_planner_app/view/widgets/toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExpenseController extends GetxController {
  TextEditingController valueController = TextEditingController();
  TextEditingController descrController = TextEditingController();
  TextEditingController labelController = TextEditingController();
  sheetsController refesh = Get.put(sheetsController());
  var formkey = GlobalKey<FormState>();
  int total = 0;
  List<Map<String, dynamic>> expenses = [];

  void addData() {
    if (formkey.currentState!.validate()) {
      Map<String, dynamic> data = {
        "label": labelController.text,
        "description": descrController.text,
        "value": int.parse(valueController.text),
      };
      expenses!.add(data);
      print(expenses);
      total += int.parse(valueController.text);
      valueController.clear();
      descrController.clear();
      labelController.clear();
      update();
    }
  }

  Future<void> addLabel({
    // required String label,
    required String sheetId,
    required Map<String, dynamic> data,
    String? token,
  }) async {
    Http.postData(
            endpoint: '${Endpoint.sheetData}/$sheetId', token: token, map: data)
        .then((value) {
      print("sheet id!!!! $sheetId");
    });
  }

  String? sheetId;
  bool state = true;

  Future<void> createSheat({
    required String sheetType,
  }) async {
    state = false;
    Map<String, dynamic> data = {"sheet_type": sheetType};
    update();
    String? token = CacheHelper.prefs!.getString('token');
    Http.postData(endpoint: Endpoint.sheetData, token: token, map: data)
        .then((value) async {
      sheetId = value['data']['_id'];
      await test(expense: expenses, toke: token!, id: sheetId);

      await refesh.getSheetData();
      state = true;
      update();
      Get.offAllNamed(
        AppRoutes.bottomNavigationBar,
      );
      toast(msg: value['msg'], color: Colors.green);
      valueController.clear();
      descrController.clear();
      labelController.clear();
      update();
    });
    update();
  }

  Future<void> test(
      {String? id,
      required List<Map<String, dynamic>> expense,
      required String toke}) async {
    for (int i = 0; i < expense.length; i++) {
      await addLabel(data: expenses[i], sheetId: id!, token: toke).then((value) {
        refesh.getSheetData();
      });
    }
  }
}
