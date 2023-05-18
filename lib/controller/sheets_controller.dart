import 'package:budget_planner_app/constants/app_routes.dart';
import 'package:budget_planner_app/constants/endpoint.dart';
import 'package:budget_planner_app/helper/cashe_helper.dart';
import 'package:budget_planner_app/helper/http_helper.dart';
import 'package:budget_planner_app/model/sheet_model.dart';
import 'package:budget_planner_app/view/widgets/toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class sheetsController extends GetxController {
  
  late SheetModel model;
  bool state = true;
  bool exportstate = true;
  bool importstate = true;
  String? sheetId;
  Future<void> createSheat({
    required String sheetType,
  }) async {
    if (sheetType == 'export') {
      exportstate = false;
    } else {
      importstate = false;
    }
    Map<String, dynamic> data = {"sheet_type": sheetType};
    update();
    String? token = CacheHelper.prefs!.getString('token');
    print(token);
    Http.postData(endpoint: Endpoint.sheetData, token: token, map: data)
        .then((value) async {
      CacheHelper.prefs?.setString("sheetId", value['data']['_id']) ;

      await getSheetData().then((value) {});
      importstate = true;
      exportstate = true;
      
          Get.toNamed(AppRoutes.exportScreen, arguments: sheetType);

      toast(msg: value['msg'], color: Colors.green);
    });
    update();
  }

  Future<void> getSheetData() async {
    state = false;
    String? token = CacheHelper.prefs!.getString('token');
    Http.getData(token: token, url: Endpoint.sheetData).then((value) {
      model = SheetModel.fromJson(value);
      state = true;
      update();
    });
    update();
  }

  @override
  void onInit() {
    getSheetData();
  }
}
