import 'package:budget_planner_app/constants/endpoint.dart';
import 'package:budget_planner_app/helper/cashe_helper.dart';
import 'package:budget_planner_app/helper/http_helper.dart';
import 'package:budget_planner_app/model/sheet_model.dart';
import 'package:get/get.dart';

class sheetsController extends GetxController {
  late SheetModel model;
  @override
  void onInit() {
    var url;
    String? token = CacheHelper.prefs!.getString('token');
    Http.getData(token: token, url: Endpoint.sheetData).then((value) {
      model = SheetModel.fromJson(value);
      print("messsssssssss ${model.message}");
      print("messsssssssss ${model.data[1]}");
    });
  }
}
