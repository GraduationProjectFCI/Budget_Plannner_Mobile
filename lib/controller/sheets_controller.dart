import 'package:budget_planner_app/constants/endpoint.dart';
import 'package:budget_planner_app/helper/cashe_helper.dart';
import 'package:budget_planner_app/helper/http_helper.dart';
import 'package:budget_planner_app/model/sheet_model.dart';
import 'package:budget_planner_app/view/widgets/toast.dart';
import 'package:get/get.dart';

class sheetsController extends GetxController {
  late SheetModel model;
  int state = 1;
  @override
  void onInit() {
    state = 1;
    var url;
    String? token = CacheHelper.prefs!.getString('token');
    Http.getData(token: token, url: Endpoint.sheetData).then((value) {
      model = SheetModel.fromJson(value);
      if (model.data == null) {
        state = 2;
      } else {
        state = 3;
      }

      update();
    });
    update();
  }

  RxBool exportButtomState = true.obs;
  RxBool importButtomState = true.obs;

  List<String> sheetInfo = [];
  Future<void> createSheat({
    required String sheetType,
  }) async {
    if (sheetType == 'export') {
      exportButtomState = false.obs;
    } else {
      importButtomState = false.obs;
    }
    sheetInfo.add(sheetType);
    Map<String, dynamic> data = {"sheet_type": sheetType};

    String? token = CacheHelper.prefs!.getString('token');
    Http.postData(endpoint: Endpoint.sheetData, token: token, map: data)
        .then((value) {
      sheetInfo.add(value['data']['_id']);
      toast(msg: value['msg']);
      exportButtomState = true.obs;
      importButtomState = true.obs;
      update();
    });
    update();
  }
}
