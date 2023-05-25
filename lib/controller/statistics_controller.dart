import 'package:budget_planner_app/constants/endpoint.dart';
import 'package:budget_planner_app/helper/cashe_helper.dart';
import 'package:budget_planner_app/helper/http_helper.dart';
import 'package:budget_planner_app/model/statistics.dart';
import 'package:get/get.dart';

class StatisticsController extends GetxController {
  late StatisticsModel model;
  int spanBudget = 0;
  int state = 1;
  Future<void> getStatisticData() async {
    state = 1;
    var url;
    String? token = CacheHelper.prefs!.getString('token');
    Http.getData(token: token, url: Endpoint.statisticsData).then((value) {
      if (value['msg'] != 'Forbidden') {
        model = StatisticsModel.fromJson(value);

        if (model.data == null) {
          state = 2;
        } else {
          state = 3;
          spanBudget = model.spentBudget;
        }

        update();
      }
    });
    update();
  }

  @override
  void onInit() {
    getStatisticData();
  }
}
