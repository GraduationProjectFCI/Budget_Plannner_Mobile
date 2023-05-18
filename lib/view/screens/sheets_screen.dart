import 'package:budget_planner_app/constants/app_color.dart';
import 'package:budget_planner_app/constants/app_routes.dart';
import 'package:budget_planner_app/controller/expense_controller.dart';
import 'package:budget_planner_app/controller/sheet_info_controller.dart';
import 'package:budget_planner_app/controller/sheets_controller.dart';
import 'package:budget_planner_app/view/screens/sheet_info.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/constant.dart';
import '../widgets/custom_button.dart';

class SheetsScreen extends StatelessWidget {
  SheetsScreen({super.key});
  sheetsController controller = Get.put(sheetsController());
  ExpenseController cont = Get.put(ExpenseController());

  @override
  Widget build(BuildContext context) {
    cont.expenses.clear();
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.backgroundColor,
        title: const Text(
          'Sheets',
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
                textButton: 'Add import',
                onPressed: () {
                  Get.toNamed(
                    AppRoutes.exportScreen,
                    arguments: "import",
                  );
                },
              ),
              const SizedBox(width: 10),
              CustomButton(
                paddingLeft: 5,
                paddingRight: 5,
                textButton: 'Add Export',
                onPressed: () {
                  Get.toNamed(
                    AppRoutes.exportScreen,
                    arguments: "export",
                  );
                },
              ),
              const SizedBox(width: 10),
            ],
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
              child: SizedBox(
                height: double.infinity,
                child: GetBuilder<sheetsController>(builder: (c) {
                  return ConditionalBuilder(
                    condition: controller.state,
                    fallback: (context) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    builder: (context) {
                      return ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) => CustomContainer(
                              sheetId:
                                  '${controller.model.data![index].sheetId}',
                              date:
                                  '${controller.model.data![index].updatedAt}',
                              money: '${controller.model.data![index].value}'),
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 10),
                          itemCount: controller.model.data!.length);
                    },
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomContainer extends StatelessWidget {
  CustomContainer({
    required this.date,
    required this.sheetId,
    this.money,
    super.key,
  });

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
          controller.getSheetExpense(sheetId: sheetId).then((value) {
            Get.toNamed(AppRoutes.sheetInfo, arguments: sheetId);
          });
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            Text(
              '${money} EGP',
              style: const TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.w300,
                height: 1,
                color: Color(0xff000000),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
