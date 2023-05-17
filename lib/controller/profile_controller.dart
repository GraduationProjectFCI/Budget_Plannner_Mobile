import 'package:budget_planner_app/constants/app_color.dart';
import 'package:budget_planner_app/constants/endpoint.dart';
import 'package:budget_planner_app/helper/cashe_helper.dart';
import 'package:budget_planner_app/models/profile_model.dart';
import 'package:budget_planner_app/view/widgets/toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/app_routes.dart';
import '../helper/http_helper.dart';

class ProfileController extends GetxController {
  RxBool state = true.obs;
  ProfileModel? profileModel;
  Future<ProfileModel?> getProfileData() async {
    print('helllllo get getProfileData');
    state = false.obs;
    String? token = CacheHelper.prefs?.getString('token');
    WidgetsFlutterBinding.ensureInitialized();
    update();
    Http.getData(url: Endpoint.profile, token: token).then(
      (value) async {
        print(value);

        if (value['userData'] != null) {
          // print('success!!');
          profileModel = await ProfileModel.fromJson(value);
          // toast(msg: '${profileModel?.msg}', color: AppColor.buttonColor);
          // print(profileModel?.userData.name);
          state = true.obs;
          WidgetsFlutterBinding.ensureInitialized();
          update();
        } else {
          print('error');
          toast(msg: '${value['msg']}');
          state = true.obs;
          WidgetsFlutterBinding.ensureInitialized();
          update();
        }
      },
    );

    update();
    return profileModel;
  }

  @override
  void onInit() {
    getProfileData();
    super.onInit();
  }

  @override
  void onClose() {
    Get.deleteAll();
    super.onClose();
  }
}
