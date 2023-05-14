import 'package:budget_planner_app/constants/endpoint.dart';
import 'package:budget_planner_app/helper/cashe_helper.dart';
import 'package:budget_planner_app/helper/http_helper.dart';
import 'package:budget_planner_app/model/deadline_model.dart';
import 'package:budget_planner_app/view/widgets/toast.dart';
import 'package:get/get.dart';

class ExpenseController extends GetxController {
  RxBool state = true.obs;
  int total = 0;
  Future<void> sendData({
    required String label,
    required String sheetId,
    String description = 'no description',
    required int values,
  }) async {
    state = false.obs;
    Map<String, dynamic> data = {
      "label": label,
      "description": description,
      "value": values
    };

    String? token = CacheHelper.prefs!.getString('token');
    Http.postData(
            endpoint: '${Endpoint.sheetData}/$sheetId', token: token, map: data)
        .then((value) {
      toast(msg: value['msg']);
      print("sheet id!!!! $sheetId");
      total += values;
      state = true.obs;
      update();
    });
    update();
  }
}
