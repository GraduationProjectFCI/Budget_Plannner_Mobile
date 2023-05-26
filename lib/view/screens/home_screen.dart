import 'package:budget_planner_app/constants/app_color.dart';
import 'package:budget_planner_app/constants/app_routes.dart';
import 'package:budget_planner_app/controller/home_controller.dart';
import 'package:budget_planner_app/controller/label_controller.dart';
import 'package:budget_planner_app/functions/refresh_data.dart';
import 'package:budget_planner_app/view/widgets/custom_button.dart';
import 'package:budget_planner_app/view/widgets/custom_slider.dart';
import 'package:budget_planner_app/view/widgets/toast.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:countup/countup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key});

  HomeController controllerHome = Get.put(HomeController());
  LabelController controllerlabel = Get.put(LabelController());

  @override
  Widget build(BuildContext context) {
    final hight = MediaQuery.of(context).size.height;
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
        // width: double.infinity,
        padding: const EdgeInsets.all(16.0),
        child: RefreshIndicator(
          onRefresh: () async {
            print('loaded data');
            await loadHomeData();
            // return Future.delayed(Duration(seconds: 1));
          },
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              GetBuilder<HomeController>(
                builder: (controller) => Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        'Spent',
                        style: TextStyle(
                            fontSize: 26, fontWeight: FontWeight.w100),
                      ),
                      Countup(
                        begin: 0,
                        end: controller.homeModel?.data.spent.toDouble() ?? 0,
                        duration: const Duration(seconds: 3),
                        separator: ',',
                        style: const TextStyle(
                            fontSize: 70, fontWeight: FontWeight.w200),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Total : ',
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.w200),
                              ),
                              Countup(
                                begin: 0,
                                end: controller.homeModel?.data.total
                                        .toDouble() ??
                                    0,
                                duration: const Duration(seconds: 3),
                                separator: ',',
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w200),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'remaining : ',
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.w200),
                              ),
                              Countup(
                                begin: 0,
                                end: controller.homeModel?.data.remaining
                                        .toDouble() ??
                                    0,
                                duration: const Duration(seconds: 3),
                                separator: ',',
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w200),
                              ),
                            ],
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
                      // const SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: hight / 2,
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
                          child: Row(
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
                        CustomSlider(
                          max: controller.limitsModel?.limits[index].limit ?? 0,
                          value:
                              controller.limitsModel?.limits[index].value ?? 0,
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
      ),
    );
  }
}
