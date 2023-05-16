import 'package:budget_planner_app/constants/app_color.dart';
import 'package:budget_planner_app/controller/home_controller.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key});

  HomeController controllerHome = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  children: const [
                    Text(
                      'Home',
                      style: TextStyle(
                        fontWeight: FontWeight.w100,
                        fontSize: 30,
                      ),
                    )
                  ],
                ),
                GetBuilder<HomeController>(
                  builder: (controller) => ConditionalBuilder(
                    condition: controller.state.isTrue,
                    fallback: (context) => const Center(
                        heightFactor: 20, child: CircularProgressIndicator()),
                    builder: (context) => Container(
                      //  margin: EdgeInsets.all(30),
                      padding: const EdgeInsets.all(30),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: AppColor.backgroundColor,
                      ),

                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            'Spent',
                            style: TextStyle(
                                fontSize: 26, fontWeight: FontWeight.w100),
                          ),
                          Text(
                            '${controller.homeModel?.data.spent}',
                            style: const TextStyle(
                                fontSize: 85, fontWeight: FontWeight.w100),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'Total : ${controller.homeModel?.data.total}',
                                style: const TextStyle(
                                  fontSize: 17,
                                ),
                              ),
                              Text(
                                'remaining : ${controller.homeModel?.data.remaining}',
                                style: const TextStyle(
                                  fontSize: 17,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
