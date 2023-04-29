import 'package:budget_planner_app/helper/http_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

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
  String userId = '644c5648ca583538b257c403';
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  signUp() async {
    print('helllllo sign up');
    if (formKey.currentState!.validate()) {
      // var response = await Http.register(
      //   name: nameTextController.text,
      //   email: emailTextController.text,
      //   gender: genderTextController.text,
      //   age: ageTextController.text,
      //   budget: budgetAverageTextController.text,
      //   password: passwordTextController.text,
      //   birthdate: birthdateTextController.text,
      //   currency: currencyTextController.text,
      // );
      // userId = response['user_id'];
      // print("from controller ------    $response");

      // Get.offNamed(AppRoutes.confirmation);
      print('Valid');
    } else {
      print('Not Valid');
    }
  }

  @override
  goToLogin() {
    // Get.offNamed(AppRoutes.login);
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
