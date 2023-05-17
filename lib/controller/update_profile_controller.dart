import 'package:budget_planner_app/controller/profile_controller.dart';
import 'package:budget_planner_app/helper/http_helper.dart';
import 'package:budget_planner_app/models/register_model.dart';
import 'package:budget_planner_app/view/widgets/toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

import '../constants/app_routes.dart';
import '../constants/endpoint.dart';
import '../helper/cashe_helper.dart';

class UpdateProfileController extends GetxController {
  ProfileController con = Get.put(ProfileController());
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

  @override
  updateprofile() async {
   

    if (formKey.currentState!.validate()) {
      state = false.obs;
      WidgetsFlutterBinding.ensureInitialized();
      update();
      Map<String, dynamic> map = {
        "name": nameTextController.text,
        "email": emailTextController.text,
        "gender": genderTextController.text,
        //  ageTextController.text,
        "budget": budgetAverageTextController.text,
        //  passwordTextController.text,
        "birthdate": birthdateTextController.text,
        "currency": currencyTextController.text,
      };
      String? token = CacheHelper.prefs!.getString('token');
      Http.updateData(
        endpoint: Endpoint.profile,
        map: map,
        token: token,
      ).then((value) async {
        state = true.obs;

        
          toast(msg: value['msg'].toString(), color: Colors.green);
          con.getProfileData().then((value) {
            Get.back();
          });
        
        update();
      });
    }
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
