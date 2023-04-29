import 'package:budget_planner_app/controller/register_controller.dart';
import 'package:budget_planner_app/helper/http_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class ConfirmationController extends GetxController {
  late TextEditingController codeTextController;
  late RegisterController controller;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  confirm() async {
    controller = RegisterController();
    // if (formKey.currentState!.validate()) {
    print('helllllo confirm');
    var response = await Http.confirmation(
      userId: controller.userId,
      code: codeTextController.text,
    );
    print("from controller ------    $response");

    // Get.offNamed(AppRoutes.confirmation);
    print('Valid');
    // } else {
    print('Not Valid');
    // }
  }

  @override
  goToLogin() {
    // Get.offNamed(AppRoutes.login);
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
