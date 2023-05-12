import 'package:budget_planner_app/constants/appcolor.dart';
import 'package:budget_planner_app/controller/sheets_controller.dart';
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
                  const Text(
                    'Sheets',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      height: 1,
                      color: Color(0xff000000),
                    ),
                  ),
                  SizedBox(
                    width: 100,
                    // function
                    child: CustomButton(textButton: 'Add sheet'),
                  ),
                ],
              ),
              Expanded(
                child: GetBuilder<sheetsController>(builder: (c) {
                  return ConditionalBuilder(
                    condition: controller.state == 3,
                    fallback: (context) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    builder: (context) {
                      print("eeeeeeeeeeeeeeeeeeeee");
                      return ListView.separated(
                          itemBuilder: (context, index) => CustomContainer(
                              
                              date: '${controller.model.data[index].updatedAt}',
                              money: '${controller.model.data[index].value}'),
                          separatorBuilder: (context, index) =>
                              SizedBox(height: 10),
                          itemCount: controller.model.data.length);
                      // Container(
                      //   child: ConditionalBuilder(
                      //     condition: controller.state == 3,
                      //     fallback: (context) => Center(
                      //       child: Text(
                      //         'no data found',
                      //         style: TextStyle(
                      //             fontSize: 40,
                      //             fontWeight: FontWeight.w500,
                      //             color: Colors.grey),
                      //       ),
                      //     ),
                      //     builder: (context) => ListView.separated(
                      //         itemBuilder: (context, index) => CustomContainer(
                      //             label:
                      //                 '${controller.model.data[index].sheetType}',
                      //             date:
                      //                 '${controller.model.data[index].sheetType}',
                      //             money:
                      //                 '${controller.model.data[index].value}'),
                      //         separatorBuilder: (context, index) =>
                      //             SizedBox(height: 10),
                      //         itemCount: controller.model.data.length),
                      //   ),
                      // );
                    },
                  );
                }),
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
    this.money,
    super.key,
  });
  
  String date;
  String? money;

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
    );
  }
}
