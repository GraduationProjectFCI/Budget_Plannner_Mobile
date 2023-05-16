import 'package:budget_planner_app/constants/endpoint.dart';
import 'package:budget_planner_app/helper/cashe_helper.dart';
import 'package:budget_planner_app/helper/http_helper.dart';
import 'package:budget_planner_app/model/deadline_model.dart';
import 'package:get/get.dart';

class DeadlineController extends GetxController {
  late DeadlineModel model;
  int state = 1;
  void getDeadlineData(){
     state = 1;
    
    String? token = CacheHelper.prefs!.getString('token');
    Http.getData(token: token, url: Endpoint.deadlineData).then((value) {
      model = DeadlineModel.fromJson(value);

      if (model.data == null) {
        state = 2;
      } else {
        state = 3;
      }

      update();
    });
    update();
  }
  @override
  void onInit() {
    getDeadlineData();
    
  }
}
