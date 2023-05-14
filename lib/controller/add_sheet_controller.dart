import 'package:budget_planner_app/constants/endpoint.dart';
import 'package:budget_planner_app/helper/cashe_helper.dart';
import 'package:budget_planner_app/helper/http_helper.dart';
import 'package:budget_planner_app/model/deadline_model.dart';
import 'package:budget_planner_app/view/widgets/toast.dart';
import 'package:get/get.dart';

class AddSheetController extends GetxController {
  RxBool state = true.obs;
  Future<void> sendData({
    required String sheetType,
    required int value,
  }) async {
    state = false.obs;
    Map<String, dynamic> data = {
      "sheet_type": sheetType,
      "value": value
    };

    String? token = CacheHelper.prefs!.getString('token');
    Http.postData(endpoint: Endpoint.deadlineData, token: token, map: data)
        .then((value) {
      toast(msg: value['msg']);
      state = true.obs;
      update();
    });
    update();
  }
}
