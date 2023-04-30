import 'package:budget_planner_app/helper/http_helper.dart';
import 'package:budget_planner_app/view/widgets/toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

import '../constants/approutes.dart';

class RegisterController extends GetxController {
  late TextEditingController nameTextController;
  late TextEditingController emailTextController;
  late TextEditingController genderTextController;
  late TextEditingController ageTextController;
  late TextEditingController budgetAverageTextController;
  late TextEditingController currencyTextController;
  late TextEditingController passwordTextController;
  late TextEditingController birthdateTextController;
  late TextEditingController rePasswordTextController;
  late String userId;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  signUp() async {
    print('helllllo sign up');

    if (passwordTextController.text != rePasswordTextController.text) {
      toast(msg: 'the password not the same');

      return;
    }
    if (formKey.currentState!.validate()) {
      var response = await Http.register(
        name: nameTextController.text,
        email: emailTextController.text,
        gender: genderTextController.text,
        age: ageTextController.text,
        budget: budgetAverageTextController.text,
        password: passwordTextController.text,
        birthdate: birthdateTextController.text,
        currency: currencyTextController.text,
      );

      if (response['status'] == 200) {
        userId = response['user_id'];
        toastSucsses(msg: response['msg']);
        goToConfirm();
      } else if (response['status'] == 400) {
        toast(msg: response['msg'][0]);
      } else {
        toast(msg: response['msg'][0]);
      }
    }
  }

  @override
  goToConfirm() {
    Get.offNamed(AppRoutes.confirmation);
  }

  @override
  void onInit() {
    nameTextController = TextEditingController();
    emailTextController = TextEditingController();
    genderTextController = TextEditingController();
    ageTextController = TextEditingController();
    budgetAverageTextController = TextEditingController();
    currencyTextController = TextEditingController();
    passwordTextController = TextEditingController();
    rePasswordTextController = TextEditingController();
    birthdateTextController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    nameTextController.dispose();
    emailTextController.dispose();
    genderTextController.dispose();
    ageTextController.dispose();
    budgetAverageTextController.dispose();
    currencyTextController.dispose();
    passwordTextController.dispose();
    birthdateTextController.dispose();
    super.dispose();
  }
}
