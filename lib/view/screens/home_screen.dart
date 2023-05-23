import 'package:budget_planner_app/constants/app_color.dart';
import 'package:budget_planner_app/constants/app_routes.dart';
import 'package:budget_planner_app/controller/home_controller.dart';
import 'package:budget_planner_app/controller/label_controller.dart';
import 'package:budget_planner_app/view/widgets/custom_button.dart';
import 'package:budget_planner_app/view/widgets/custom_slider.dart';
import 'package:budget_planner_app/view/widgets/toast.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key});

  HomeController controllerHome = Get.put(HomeController());
  LabelController controllerlabel = Get.put(LabelController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.backgroundColor,
        title: const Text(
          'Home',
          style: TextStyle(
            fontWeight: FontWeight.w100,
            fontSize: 30,
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: GetBuilder<HomeController>(
                builder: (controller) => Container(
                  //  margin: EdgeInsets.all(30),
                  padding: const EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: AppColor.backgroundColor,
                  ),

                  child: SingleChildScrollView(
                    physics: const NeverScrollableScrollPhysics(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          'Spent',
                          style: TextStyle(
                              fontSize: 26, fontWeight: FontWeight.w100),
                        ),
                        Text(
                          '${controller.homeModel?.data.spent ?? 0}',
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
                              'Total : ${controller.homeModel?.data.total ?? 0}',
                              style: const TextStyle(
                                fontSize: 17,
                              ),
                            ),
                            Text(
                              'remaining : ${controller.homeModel?.data.remaining ?? 0}',
                              style: const TextStyle(
                                fontSize: 17,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 14,
                        ),
                        const Divider(thickness: 2),
                        CustomButton(
                          textButton: 'Add limit',
                          //function
                          onPressed: () async {
                            Get.toNamed(AppRoutes.limitAdd)?.then((value) {
                              controller.getLimitsData();
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: GetBuilder<HomeController>(
                builder: (controller) => ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: controller.flagGetLimit
                      ? controller.limitsModel?.limits.length
                      : 0,
                  itemBuilder: (context, index) => Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: ConditionalBuilder(
                          condition: controller.flagGetLimit,
                          fallback: (context) => Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              // const Spacer(
                              //   flex: 2,
                              // ),
                              Text(
                                '${controller.limitsModel?.limits[index].label}',
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w300),
                              ),
                              const Spacer(),
                              GetBuilder<HomeController>(
                                builder: (co) => ConditionalBuilder(
                                  condition: controller.updateState,
                                  fallback: (context) => const Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                  builder: (context) => InkWell(
                                    onTap: () {
                                      toast(msg: 'please wait data is loading');
                                    },
                                    child: const Icon(
                                      Icons.edit,
                                      color: Colors.green,
                                    ),
                                  ),
                                ),
                              ),
                              GetBuilder<HomeController>(
                                builder: (co) => ConditionalBuilder(
                                  condition: controller.deleteState.isTrue,
                                  fallback: (context) => const Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                  builder: (context) => InkWell(
                                      onTap: () {
                                        toast(
                                            msg: 'please wait data is loading');
                                      },
                                      child: const Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      )),
                                ),
                              )
                            ],
                          ),
                          builder: (context) => Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              // const Spacer(
                              //   flex: 2,
                              // ),
                              Text(
                                '${controller.limitsModel?.limits[index].label}',
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w300),
                              ),
                              const Spacer(),
                              GetBuilder<HomeController>(
                                builder: (co) => ConditionalBuilder(
                                  condition: controller.updateState,
                                  fallback: (context) => const Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                  builder: (context) => InkWell(
                                    onTap: () {
                                      Get.toNamed(AppRoutes.editLimit,
                                          arguments: controller
                                              .limitsModel?.limits[index]);
                                    },
                                    child: const Icon(
                                      Icons.edit,
                                      color: Colors.green,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),

                              GetBuilder<HomeController>(
                                builder: (co) => InkWell(
                                    onTap: () async {
                                      await controller.deleteLimit(
                                          limitUrl: controller
                                              .limitsModel!.limits[index].id);
                                    },
                                    child: const Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    )),
                              )
                            ],
                          ),
                        ),
                      ),
                      CustomSlider(
                        max: controller.limitsModel?.limits[index].limit ?? 0,
                        value: controller.limitsModel?.limits[index].value ?? 0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Expanded(
            //   child: GetBuilder<HomeController>(
            //     builder: (controller) => ConditionalBuilder(
            //       condition: controller.state.isTrue,
            //       builder: (context) => ListView.builder(
            //         physics: const BouncingScrollPhysics(),
            //         itemCount: controller.limitsModel?.limits.length,
            //         itemBuilder: (context, index) => Column(
            //           children: [
            //             Text(
            //               '${controller.limitsModel?.limits[index].label}',
            //               style: const TextStyle(
            //                   fontSize: 20, fontWeight: FontWeight.w300),
            //             ),
            //             CustomSlider(
            //               max: controller.limitsModel?.limits[index].limit ?? 0,
            //               value:
            //                   controller.limitsModel?.limits[index].value ?? 0,
            //             ),
            //           ],
            //         ),
            //       ),
            //       fallback: (context) => ListView.builder(
            //         physics: const BouncingScrollPhysics(),
            //         itemCount: 3,
            //         itemBuilder: (context, index) => Column(
            //           children: [
            //             const Text(
            //               'limit name',
            //               style: TextStyle(
            //                   fontSize: 20, fontWeight: FontWeight.w300),
            //             ),
            //             CustomSlider(
            //               max: controller.limitsModel?.limits[index].limit ?? 0,
            //               value:
            //                   controller.limitsModel?.limits[index].value ?? 0,
            //             ),
            //           ],
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
