import 'package:budget_planner_app/constants/app_color.dart';
import 'package:budget_planner_app/constants/app_routes.dart';
import 'package:budget_planner_app/controller/profile_controller.dart';
import 'package:budget_planner_app/view/widgets/custom_button.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/constant.dart';
import '../../helper/cashe_helper.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileController controller = Get.put(ProfileController());
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.backgroundColor,
        title: const Text(
          'Profile',
          style: TextStyle(
            fontWeight: FontWeight.w100,
            fontSize: 30,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: GetBuilder<ProfileController>(
            builder: (controller) => ConditionalBuilder(
              condition: controller.state.isTrue,
              fallback: (context) => const Center(
                  heightFactor: 20, child: CircularProgressIndicator()),
              builder: (context) => Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  const CircleAvatar(
                    radius: 80,
                    backgroundImage: AssetImage('assets/photo2.jpg'),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  CustomContainer(
                      label: 'Name',
                      text: '${controller.profileModel?.userData.name}'),
                  const SizedBox(
                    height: 5,
                  ),
                  CustomContainer(
                      label: 'E-mail',
                      text: '${controller.profileModel?.userData.email}'),
                  const SizedBox(
                    height: 5,
                  ),
                  CustomContainer(
                      label: 'Gender',
                      text: '${controller.profileModel?.userData.gender}'),
                  const SizedBox(
                    height: 5,
                  ),
                  CustomContainer(
                      label: 'Budget',
                      text: '${controller.profileModel?.userData.budget}'),
                  const SizedBox(
                    height: 5,
                  ),
                  CustomContainer(
                      label: 'Currency',
                      text: '${controller.profileModel?.userData.currency}'),
                  // CustomContainer(label: 'Address', text: '${controller.profileModel?.userData.}'),
                  const SizedBox(
                    height: 5,
                  ),
                  CustomButton(
                    colorButton: AppColor.buttonColor,
                    textButton: 'Update Profile',
                    onPressed: () async {
                      Get.toNamed(AppRoutes.updateProfile);
                    },
                  ),

                  const SizedBox(
                    height: 10,
                  ),
                  CustomButton(
                    colorButton: Colors.red,
                    textButton: 'Log out',
                    onPressed: () async {
                      CacheHelper.prefs?.clear().then((value) async {
                        await Get.offAllNamed(AppRoutes.login);
                        controller.onClose();
                      });
                    },
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomContainer extends StatelessWidget {
  CustomContainer({super.key, required this.label, required this.text});
  String label;
  String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 48,
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.fromLTRB(11, 11, 11, 11),
      decoration: BoxDecoration(
        color: const Color(0xffffffff),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        '${label}: ${text}',
        style: const TextStyle(
          fontSize: 19,
          fontWeight: FontWeight.w300,
          height: 1.115,
          color: Color(0xff000000),
        ),
      ),
    );
  }
}
