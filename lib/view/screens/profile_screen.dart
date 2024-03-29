import 'package:budget_planner_app/constants/app_color.dart';
import 'package:budget_planner_app/constants/app_routes.dart';
import 'package:budget_planner_app/controller/profile_controller.dart';
import 'package:budget_planner_app/functions/refresh_data.dart';
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
    final hight = MediaQuery.of(context).size.height;
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
        actions: [
          IconButton(
              onPressed: () {
                Get.toNamed(AppRoutes.AddDeleteLabelsScreen);
              },
              icon: const Icon(
                Icons.add,
                color: AppColor.buttonColor,
              )),
          IconButton(
              onPressed: () async {
                CacheHelper.prefs?.clear().then((value) async {
                  await Get.offAllNamed(AppRoutes.login);
                  controller.onClose();
                });
              },
              icon: const Icon(
                Icons.logout,
                color: Colors.red,
              ))
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: RefreshIndicator(
          onRefresh: () async {
            print('loaded data');
            await loadProfileData();
            // return Future.delayed(Duration(seconds: 1));
          },
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: GetBuilder<ProfileController>(
              builder: (controller) => ConditionalBuilder(
                condition: controller.state.isTrue,
                fallback: (context) => const Center(
                    heightFactor: 20, child: CircularProgressIndicator()),
                builder: (context) => SizedBox(
                  height: hight / 1.2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 5,
                      ),
                      const CircleAvatar(
                        backgroundColor: Colors.amber,
                        radius: 80,
                        backgroundImage: AssetImage('assets/OIP.jpeg'),
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
                          text:
                              '${controller.profileModel?.userData.currency}'),
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
                    ],
                  ),
                ),
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
      child: Row(
        children: [
          Text(
            '${label}:',
            style: const TextStyle(
              overflow: TextOverflow.ellipsis,
              fontSize: 16,
              fontWeight: FontWeight.w300,
              height: 1.115,
              color: Color(0xff000000),
            ),
          ),
          Text(
            '${text}',
            style: const TextStyle(
              overflow: TextOverflow.ellipsis,
              fontSize: 16,
              fontWeight: FontWeight.w300,
              height: 1.115,
              color: Color(0xff000000),
            ),
          ),
        ],
      ),
    );
  }
}
