import 'package:budget_planner_app/constants/app_color.dart';
import 'package:budget_planner_app/controller/sheet_info_controller.dart';

import 'package:budget_planner_app/view/widgets/custom_button.dart';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:budget_planner_app/helper/cashe_helper.dart';
import '../../constants/app_routes.dart';

class SheetInfo extends StatelessWidget {
  sheetInfoController controller = Get.put(sheetInfoController());
  SheetInfo({
    super.key,
  });
  String sheetId = Get.arguments;
  @override
  Widget build(BuildContext context) {
    CacheHelper.prefs?.setString('sheetId', sheetId);

    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppColor.backgroundColor,
        title: const Text(
          'Sheet Details',
          style: TextStyle(
            fontWeight: FontWeight.w100,
            fontSize: 30,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(children: [
          Expanded(
            child: SizedBox(
              height: double.infinity,
              child: GetBuilder<sheetInfoController>(builder: (c) {
                return ConditionalBuilder(
                  condition: controller.state,
                  fallback: (context) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  builder: (context) {
                    print("!!!!!!!!!!!! ${controller.model.expenses}");
                    return Container(
                      height: 380,
                      child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        separatorBuilder: (context, index) => const Divider(
                          height: 5,
                          thickness: 1,
                        ),
                        itemCount: controller.model.expenses!.length,
                        itemBuilder: (context, index) {
                          return CustomContainer(
                            date: controller.model.expenses![index].label,
                            sheetId: controller.model.expenses![index].labelId,
                            money: '${controller.model.expenses![index].value}',
                          );
                        },
                      ),
                    );
                  },
                );
              }),
            ),
          ),
          GetBuilder<sheetInfoController>(
            builder: (c) => ConditionalBuilder(
              condition: controller.deletestate,
              builder: (context) => CustomButton(
                textButton: "Delete All",
                onPressed: () {
                  controller.deleteSheet(sheetId: sheetId);
                },
              ),
              fallback: (context) =>
                  const Center(child: CircularProgressIndicator()),
            ),
          ),
        ]),
      ),
    );
  }
}

class CustomContainer extends StatelessWidget {
  CustomContainer({
    required this.date,
    required this.sheetId,
    this.money,
    this.index,
    super.key,
  });
  int? index;
  String date;
  String? money;
  String sheetId;
  sheetInfoController controller = Get.put(sheetInfoController());
  Function()? onTap;
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
      child: InkWell(
        onTap: () {
          Get.toNamed(AppRoutes.exportUdateScreen, arguments: sheetId);
        },
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${date}',
              style: const TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.w300,
                height: 1,
                color: Color(0xff000000),
              ),
            ),
            Spacer(),
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
                controller.deleteExpense(
                    expenseId: controller.model.expenses![index!].labelId);
              },
              icon: const Icon(
                Icons.delete_forever,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
