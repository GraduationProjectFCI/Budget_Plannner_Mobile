import 'package:budget_planner_app/constants/approutes.dart';
import 'package:budget_planner_app/controller/register_controller.dart';
import 'package:budget_planner_app/helper/http_helper.dart';
import 'package:budget_planner_app/view/widgets/toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/state_manager.dart';

class ConfirmationController extends GetxController {
  late TextEditingController codeTextController;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  confirm() async {
    print('helllllo confirm');
    if (formKey.currentState!.validate()) {
      await Http.confirmation(
        code: codeTextController.text,
      ).then((value) async {
        print('value form confirm controller $value');
        if (value['status'] == 200) {
          toast(msg: '${value['msg']}', color: Colors.green);
          goToLogin();
        } else if (value['status'] == 400) {
          print('status=400');
          toast(msg: '${value['msg']}');
          toast(msg: value['error'][0].toString());
        } else {
          print('status=error');
          print(value);
          toast(msg: value['msg']);
        }
      });
      // update();
    }
  }

  @override
  goToLogin() {
    Get.offNamed(AppRoutes.login);
  }

  @override
  void onInit() {
    codeTextController = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    codeTextController.dispose();
    super.dispose();
  }
}
