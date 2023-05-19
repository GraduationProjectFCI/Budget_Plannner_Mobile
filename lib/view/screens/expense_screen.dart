import 'package:budget_planner_app/constants/app_color.dart';
import 'package:budget_planner_app/constants/constant.dart';

import 'package:budget_planner_app/view/widgets/custom_button.dart';
import 'package:budget_planner_app/view/widgets/custom_textformfield.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/expense_controller.dart';
import '../widgets/custom_list_expenses.dart';

class ExportScreen extends StatelessWidget {
  ExportScreen({super.key});
  ExpenseController controller = Get.put(ExpenseController());

  String? label;
  String sheetType = Get.arguments;

  @override
  Widget build(BuildContext context) {
    controller.expenses.clear();
    controller.total = 0;
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColor.backgroundColor,
        title: Text(
          sheetType,
          style: const TextStyle(
            fontWeight: FontWeight.w100,
            fontSize: 30,
          ),
        ),
        // actions: [

        //   const SizedBox(
        //     width: 15,
        //   )
        // ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: controller.formkey,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                // const SizedBox(
                //   height: 30,
                // ),
                SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // SizedBox(
                          // width: 100,
                          // child:
                          Expanded(
                            flex: 3,
                            child: Column(
                              children: [
                                const Text(
                                  'Labels',
                                  style: TextStyle(fontSize: 20),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                GetBuilder<ExpenseController>(
                                  builder: (controller) => DropdownButton(
                                    value: label,
                                    onChanged: (value) {
                                      controller.labelController.text =
                                          value.toString();
                                      controller.refresh();
                                      label = value;

                                      // print(value);
                                    },
                                    items: [
                                      ...List.generate(
                                        Constant.labelsList.length,
                                        (index) => DropdownMenuItem(
                                          value:
                                              Constant.labelsList[index].label,
                                          child: Text(Constant
                                              .labelsList[index].label!),
                                        ),
                                      ),
                                    ],
                                    hint: const Text('Select label'),
                                    isExpanded: true,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    dropdownColor: AppColor.buttonColor,
                                    borderRadius: BorderRadius.circular(10),
                                    iconSize: 45,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // ),
                          // const SizedBox(
                          //   width: 20,
                          // ),
                          Expanded(
                            flex: 1,
                            // child: SizedBox(
                            // width: 80,
                            child: Column(
                              children: [
                                const Text(
                                  'Values',
                                  style: TextStyle(fontSize: 20),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                // TextFormField(
                                //   keyboardType: TextInputType.number,
                                //   controller: controller.valueController,
                                //   validator: (value) {
                                //     if (value!.isEmpty) {
                                //       return "enter value";
                                //     }
                                //     return null;
                                //   },
                                //   decoration: InputDecoration(
                                //     // suffix: const Text('EGP'),
                                //     border: OutlineInputBorder(
                                //       borderRadius: BorderRadius.circular(15),
                                //     ),
                                //     fillColor: AppColor.hintTextColor,
                                //   ),
                                // ),
                                CustomTextFormField(
                                    fieldType: TextInputType.number,
                                    hintText: 'value',
                                    labelText: 'label'),
                              ],
                            ),
                            // ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      // TextFormField(
                      //   keyboardType: TextInputType.text,
                      //   controller: controller.descrController,
                      //   decoration: InputDecoration(
                      //     // suffix: const Text('EGP'),
                      //     border: OutlineInputBorder(
                      //       borderRadius: BorderRadius.circular(15),
                      //     ),
                      //     hintText: "add descrtpiton",
                      //     fillColor: AppColor.hintTextColor,
                      //   ),
                      // ),
                      CustomTextFormField(
                          fieldType: TextInputType.number,
                          hintText: 'value',
                          labelText: 'label'),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 8, right: 8),
                        child: GetBuilder<ExpenseController>(
                          builder: (c) => ConditionalBuilder(
                            condition: controller.addstate,
                            builder: (context) => CustomButton(
                              textButton: 'add',
                              onPressed: () {
                                controller.addLabel();
                                controller.addData();
                              },
                            ),
                            fallback: (context) => const Center(
                                child: CircularProgressIndicator()),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      // list
                      GetBuilder<ExpenseController>(
                        builder: (c) => BuildCustomListExpenses(
                          expenses: controller.expenses,
                        ),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              // color: AppColor.hintTextColor,
                            ),
                            child: const Text(
                              'Total',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: AppColor.hintTextColor,
                            ),
                            child: GetBuilder<ExpenseController>(
                              builder: (c) => Text(
                                '${controller.total} EGP',
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 100,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
