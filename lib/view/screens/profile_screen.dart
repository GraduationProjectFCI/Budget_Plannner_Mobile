import 'package:budget_planner_app/constants/app_color.dart';
import 'package:budget_planner_app/constants/app_routes.dart';
import 'package:budget_planner_app/controller/profile_controller.dart';
import 'package:budget_planner_app/view/widgets/custom_button.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/constant.dart';
import '../../helper/cashe_helper.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileController controller = Get.put(ProfileController());
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: SafeArea(
          child: Container(
        margin: const EdgeInsets.only(left: 10, right: 10, top: 20),
        child: SingleChildScrollView(
          child: GetBuilder<ProfileController>(
            builder: (controller) => ConditionalBuilder(
              condition: controller.state.isTrue,
              fallback: (context) => const Center(
                  heightFactor: 20, child: CircularProgressIndicator()),
              builder: (context) => Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: const [
                      Text(
                        'Profile',
                        style: TextStyle(
                          fontWeight: FontWeight.w100,
                          fontSize: 30,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 26,
                  ),
                  const CircleAvatar(
                    radius: 80,
                    backgroundImage: AssetImage('assets/photo2.jpg'),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  CustomContainer(
                      label: 'Name',
                      text: '${controller.profileModel?.userData.name}'),
                  CustomContainer(
                      label: 'E-mail',
                      text: '${controller.profileModel?.userData.email}'),
                  CustomContainer(
                      label: 'Gender',
                      text: '${controller.profileModel?.userData.gender}'),
                  CustomContainer(
                      label: 'Budget',
                      text: '${controller.profileModel?.userData.budget}'),
                  CustomContainer(
                      label: 'Currency',
                      text: '${controller.profileModel?.userData.currency}'),
                  // CustomContainer(label: 'Address', text: '${controller.profileModel?.userData.}'),
                  const SizedBox(
                    height: 5,
                  ),
                  CustomButton(
                    colorButton: Colors.red,
                    textButton: 'Log out',
                    onPressed: () async {
                      await CacheHelper.prefs?.clear;
                      Get.offAllNamed(AppRoutes.login);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      )),
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
