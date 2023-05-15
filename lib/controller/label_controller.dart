import 'package:budget_planner_app/constants/app_color.dart';
import 'package:budget_planner_app/helper/cashe_helper.dart';
import 'package:budget_planner_app/view/widgets/toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/constant.dart';
import '../constants/endpoint.dart';
import '../helper/http_helper.dart';

class LabelController extends GetxController {
  late TextEditingController labelTextController;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  RxBool state = true.obs;

  @override
  addLabel() async {
    print('helllllo label');

    if (formKey.currentState!.validate()) {
      state = false.obs;
      WidgetsFlutterBinding.ensureInitialized();
      update();
      Http.postData(
              map: {'label': labelTextController.text},
              endpoint: Endpoint.labelData,
              token: CacheHelper.prefs?.getString('token'))
          .then(
        (value) {
          print(value);
          if (value['msg'] == 'Label Added Successfully') {
            toast(msg: '${value['msg']}', color: AppColor.buttonColor);
            Constant.labelsList.add(value['data']['label']);
            labelTextController.clear();
            state = true.obs;
            WidgetsFlutterBinding.ensureInitialized();
            update();
          } else {
            toast(msg: '${value['msg']}');
            labelTextController.clear();
            state = true.obs;
            WidgetsFlutterBinding.ensureInitialized();
            update();
          }
        },
      );
      update();
    }
  }

  @override
  void onInit() {
    labelTextController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    labelTextController.dispose();
    super.dispose();
  }
}
