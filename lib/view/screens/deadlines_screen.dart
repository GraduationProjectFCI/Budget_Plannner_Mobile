import 'package:budget_planner_app/constants/app_color.dart';
import 'package:budget_planner_app/constants/app_routes.dart';
import 'package:budget_planner_app/controller/deadline_controller.dart';
import 'package:budget_planner_app/view/widgets/custom_button.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/deadline_info_controller.dart';

class DeadlinesScreen extends StatelessWidget {
  DeadlinesScreen({super.key});
  DeadlineController controller = Get.put(DeadlineController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.backgroundColor,
        title: const Text(
          'Deadlines',
          style: TextStyle(
            fontWeight: FontWeight.w100,
            fontSize: 30,
          ),
        ),
        actions: [
          Row(
            children: [
              CustomButton(
                  paddingLeft: 5,
                  paddingRight: 5,
                  textButton: 'Add deadline',
                  onPressed: () {
                    Get.toNamed(AppRoutes.addDeadline);
                  }),
              const SizedBox(
                width: 15,
              )
            ],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: GetBuilder<DeadlineController>(builder: (c) {
                return ConditionalBuilder(
                  condition: controller.state == 3,
                  fallback: (context) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  builder: (context) {
                    return ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) => CustomContainer(
                          index: index,
                            deadlineId:
                                '${controller.model.data![index].sheetId}',
                            label:
                                '${controller.model.data![index].deadlineName}',
                            date: '${controller.model.data![index].updatedAt}',
                            money: '${controller.model.data![index].value}'),
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 10),
                        itemCount: controller.model.data!.length);
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomContainer extends StatelessWidget {
  CustomContainer({
    required this.label,
    required this.index,
    required this.date,
    required this.money,
    required this.deadlineId,
    super.key,
  });
  String label;
  String date;
  String money;
  String deadlineId;
  int index;
  DeadlineController deadlinecontroller = Get.put(DeadlineController());

  UpdateDeadlineController controller = Get.put(UpdateDeadlineController());

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(AppRoutes.deadlineInfo, arguments: deadlineId);
      },
      child: Container(
        width: double.infinity,
        height: 48,
        margin: const EdgeInsets.symmetric(vertical: 4),
        padding: const EdgeInsets.fromLTRB(11, 11, 11, 11),
        decoration: BoxDecoration(
          color: const Color(0xffffffff),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${label}',
              style: const TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.w300,
                height: 1,
                color: Color(0xff000000),
              ),
            ),
            Text(
              '${date}',
              style: const TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.w300,
                height: 1,
                color: Color(0xff000000),
              ),
            ),
            Row(
              children: [
                Text(
                  '${money} EGP',
                  style: const TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w300,
                    height: 1,
                    color: Color(0xff000000),
                  ),
                ),
                  IconButton(
                  onPressed: () {
                    controller.deleteDeadline(
                        deadlinId: deadlinecontroller.model.data![index].sheetId!
                        );
                  },
                  icon: const Icon(
                    Icons.delete_forever,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
