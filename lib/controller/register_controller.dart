import 'package:budget_planner_app/helper/http_helper.dart';
import 'package:budget_planner_app/models/register_model.dart';
import 'package:budget_planner_app/view/widgets/toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

import '../constants/app_routes.dart';
import '../helper/cashe_helper.dart';

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
  DateTime? selectedDate;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  RxBool state = true.obs;
  bool isPassword = true;
  IconData icon = Icons.remove_red_eye;

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
        // age: ageTextController.text,
        budget: budgetAverageTextController.text,
        password: passwordTextController.text,
        birthdate: birthdateTextController.text,
        currency: currencyTextController.text,
      ).then((value) async {
        print('Register valueeeeeeeeeeeeee $value');
        RegisterModel registerModel = await RegisterModel.fromJson(value);
        print(value);
        // print(registerModel.msg.toString());
        // print(registerModel.userId.toString());
        state = true.obs;

        if (value['user_id'] != null) {
          // userId = registerModel.userId.toString();
          print('@@@@user id= ${registerModel.userId.toString()}');
          toast(msg: value['msg'].toString(), color: Colors.green);
          CacheHelper.prefs?.setString('user_id', '${registerModel.userId}');
          Get.offNamed(AppRoutes.confirmation);
        } else {
          state = true.obs;
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

  void showPassword() {
    if (isPassword) {
      isPassword = false;
      icon = Icons.visibility_off_outlined;
    } else {
      isPassword = true;
      icon = Icons.remove_red_eye;
    }
    update();
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      birthdateTextController.text = selectedDate.toString().substring(0, 10);
      update();
    }
    print(birthdateTextController.text);
    update();
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
