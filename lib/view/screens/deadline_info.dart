import 'package:budget_planner_app/constants/app_routes.dart';
import 'package:budget_planner_app/constants/endpoint.dart';
import 'package:budget_planner_app/controller/deadline_controller.dart';
import 'package:budget_planner_app/helper/cashe_helper.dart';
import 'package:budget_planner_app/helper/http_helper.dart';
import 'package:budget_planner_app/view/widgets/custom_button.dart';
import 'package:budget_planner_app/view/widgets/toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeadlineInfo extends StatelessWidget {
  DeadlineController controller = Get.put(DeadlineController());
  DeadlineInfo({
    super.key,
  });
  String deadlinId = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: CustomButton(
          textButton: "Delete",
          onPressed: () {
            String? token = CacheHelper.prefs!.getString('token');
            Http.delete(
                    url: '${Endpoint.deadlineDelete}$deadlinId', token: token!)
                .then((value) {
              toast(
                  msg: "${value['msg']}",
                  color: Color.fromARGB(255, 3, 216, 244));
              controller.model.data
                  ?.removeWhere((userData) => userData.sheetId == deadlinId);

              Get.offAllNamed(AppRoutes.bottomNavigationBar);
            });
          },
        ),
      ),
    );
  }
}
