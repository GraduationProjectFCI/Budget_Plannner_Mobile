import 'package:budget_planner_app/constants/app_routes.dart';
import 'package:budget_planner_app/constants/endpoint.dart';
import 'package:budget_planner_app/helper/cashe_helper.dart';
import 'package:budget_planner_app/helper/http_helper.dart';
import 'package:budget_planner_app/model/sheet_model.dart';
import 'package:budget_planner_app/view/widgets/toast.dart';
import 'package:get/get.dart';

class sheetsController extends GetxController {
  late SheetModel model;
  bool state = true;

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
