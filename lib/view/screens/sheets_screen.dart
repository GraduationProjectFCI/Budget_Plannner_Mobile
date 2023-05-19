import 'package:budget_planner_app/constants/app_color.dart';
import 'package:budget_planner_app/constants/app_routes.dart';
import 'package:budget_planner_app/controller/expense_controller.dart';
import 'package:budget_planner_app/controller/sheet_info_controller.dart';
import 'package:budget_planner_app/controller/sheets_controller.dart';
import 'package:budget_planner_app/view/screens/sheet_info.dart';
import 'package:budget_planner_app/view/widgets/toast.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/constant.dart';
import '../../helper/cashe_helper.dart';
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
              GetBuilder<sheetsController>(builder: (c) {
                return ConditionalBuilder(
                  condition: controller.importstate,
                  fallback: (context) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  builder: (context) {
                    return CustomButton(
                      paddingLeft: 5,
                      paddingRight: 5,
                      textButton: 'Add import',
                      onPressed: () {
                        controller
                            .createSheat(sheetType: "import")
                            .then((value) {});
                      },
                    );
                  },
                );
              }),
              const SizedBox(width: 10),
              GetBuilder<sheetsController>(builder: (c) {
                return ConditionalBuilder(
                  condition: controller.exportstate,
                  fallback: (context) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  builder: (context) {
                    return CustomButton(
                      paddingLeft: 5,
                      paddingRight: 5,
                      textButton: 'Add export',
                      onPressed: () {
                        controller
                            .createSheat(sheetType: "export")
                            .then((value) {});
                      },
                    );
                  },
                );
              }),
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
                              index: index,
                              time:
                                  '${controller.model.data![index].time}',
                              sheetId:
                                  '${controller.model.data![index].sheetId}',
                              sheetType:
                                  '${controller.model.data![index].sheetType}',
                              date:
                                  '${controller.model.data![index].createdAt}',
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
    required this.sheetType,
    required this.sheetId,
    required this.time,
    this.money,
    this.index,
    super.key,
  });

  String sheetType;
  String date;
  String? money;
  String sheetId;
  String time;
  int? index;
  sheetInfoController controller = Get.put(sheetInfoController());
  sheetsController sheetcontroller = Get.put(sheetsController());
  Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 55,
      // margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.fromLTRB(11, 11, 11, 11),
      decoration: BoxDecoration(
        color: const Color(0xffffffff),
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: () {
          controller.getSheetExpense(sheetId: sheetId).then((value) {
            CacheHelper.prefs?.setString('sheetId', sheetId);
            CacheHelper.prefs?.setInt('sheetIndex', index!);

            Get.toNamed(AppRoutes.sheetInfo, arguments: sheetId);
          });
        },
        child:
           
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                
                Column(
                  children: [
                    Row(
                      children: [
                        sheetType == 'export'
                        ? const Icon(
                            Icons.arrow_upward,
                            color: Colors.red,
                          )
                        : const Icon(
                            Icons.arrow_downward,
                            color: Colors.green,
                          ),
                        Text(
                          '${time}',
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w300,
                            height: 1,
                            color: Color(0xff000000),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                
                Text(
                  '${date}',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                    height: 1,
                    color: Color(0xff000000),
                  ),
                ),
                // const Spacer(),
                Row(
                  children: [
                    Text(
                      '${money} EGP',
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                        height: 1,
                        color: Color(0xff000000),
                      ),
                    ),
                     InkWell(
                      onTap: () async {
                        await controller.deleteSheet(
                            sheetId:
                                sheetcontroller.model.data![index!].sheetId);
                      },
                      child: const Icon(
                        Icons.delete,
                        color: Colors.grey,
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
