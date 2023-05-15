import 'package:budget_planner_app/helper/http_helper.dart';
import 'package:budget_planner_app/models/register_model.dart';
import 'package:budget_planner_app/view/widgets/toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

import '../constants/app_routes.dart';

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
  RxBool state = true.obs;

  @override
  signUp() async {
    print('helllllo sign up');

    if (passwordTextController.text != rePasswordTextController.text) {
      toast(msg: 'the password not the same');

      return;
    }

    if (formKey.currentState!.validate()) {
      state = false.obs;
      WidgetsFlutterBinding.ensureInitialized();
      update();
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
        print('Register valueeeeeeeeeeeeee $value');
        RegisterModel registerModel = await RegisterModel.fromJson(value);
        // print(registerModel.msg.toString());
        // print(registerModel.userId.toString());
        state = true.obs;

        if (value['user_id'] != null) {
          // userId = registerModel.userId.toString();
          print('@@@@user id= ${registerModel.userId.toString()}');
          Http.userId = registerModel.userId;

          toast(msg: value['msg'].toString(), color: Colors.green);
          Get.offNamed(AppRoutes.confirmation);
        } else {
          print('status=error');
          toast(msg: value['msg'].toString());
        }
        update();
      });
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
