import 'package:budget_planner_app/constants/app_color.dart';
import 'package:budget_planner_app/constants/app_routes.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: SafeArea(
        child: Container(
          margin:
              const EdgeInsets.only(left: 10, right: 10, top: 16, bottom: 16),
          width: double.infinity,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        const Text(
                          'Sheets',
                          style: TextStyle(
                            fontWeight: FontWeight.w100,
                            fontSize: 30,
                          ),
                        ),
                        const Spacer(),
                        Container(
                          margin: const EdgeInsets.only(left: 8, right: 8),
                          child: CustomButton(
                            textButton: 'Add import',
                            onPressed: () {
                              Get.toNamed(
                                AppRoutes.exportScreen,
                                arguments: "import",
                              );
                            },
                          ),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          margin: const EdgeInsets.only(left: 8, right: 8),
                          child: CustomButton(
                            textButton: 'Add Export',
                            onPressed: () {
                              
                                  
                                Get.toNamed(
                                  AppRoutes.exportScreen,
                                  arguments: "export" ,
                                );
                              
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
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
                        print("eeeeeeeeeeeeeeeeeeeee");
                        return ListView.separated(
                            itemBuilder: (context, index) => CustomContainer(
                                sheetId:
                                    '${controller.model.data![index].sheetId}',
                                date:
                                    '${controller.model.data![index].updatedAt}',
                                money:
                                    '${controller.model.data![index].value}'),
                            separatorBuilder: (context, index) =>
                                SizedBox(height: 10),
                            itemCount: c.model.data!.length);
                      },
                    );
                  }),
                ),
              ),
            ],
          ),
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
          Get.toNamed(AppRoutes.sheetInfo, arguments: sheetId);
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
