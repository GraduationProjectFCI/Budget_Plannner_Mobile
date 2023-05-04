import 'package:budget_planner_app/helper/http_helper.dart';
import 'package:budget_planner_app/models/register_model.dart';
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
      Http.register(
        name: nameTextController.text,
        email: emailTextController.text,
        gender: genderTextController.text,
        age: ageTextController.text,
        budget: budgetAverageTextController.text,
        password: passwordTextController.text,
        birthdate: birthdateTextController.text,
        currency: currencyTextController.text,
      ).then((value) async {
        print('valueeeeeeeeeeeeee $value');
        RegisterModel registerModel = await RegisterModel.fromJson(value);
        var registerData = await value;
        if (registerData['status'] == 200) {
          userId = value['user_id'];
          print('@@@@user id=  $userId');
          Http.userId = userId;

          toast(msg: '${value['msg']}', color: Colors.green);
          Get.offNamed(AppRoutes.confirmation);
        } else if (registerModel.status == 400) {
          print('status=400');

          for (var element in registerModel.msg) {
            toast(msg: element.toString());
          }
          update();
        } else {
          print('status=error');
          for (var element in registerModel.msg) {
            toast(msg: element.toString());
          }
        }
        update();
      });

      // print(response['msg'][0]);
      // if (response['status'] == 200) {
      //   userId = response['user_id'];
      //   toastSucsses(msg: response['msg']);
      //   goToConfirm();
      // } else if (response['status'] == 400) {
      //   toast(msg: response['msg'][0]);
      // } else {
      //   toast(msg: response['msg'][0]);
      // }
    }
  }

  goToConfirm() {
    Get.offNamed(AppRoutes.confirmation);
  }

  goToLogin() {
    Get.offNamed(AppRoutes.login);
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
