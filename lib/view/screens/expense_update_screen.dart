import 'package:budget_planner_app/constants/app_color.dart';
import 'package:budget_planner_app/constants/constant.dart';

import 'package:budget_planner_app/view/widgets/custom_button.dart';
import 'package:budget_planner_app/view/widgets/custom_textformfield.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/expenses_update_controller.dart';

class ExportUdateScreen extends StatelessWidget {
  ExportUdateScreen({super.key});
  UpdateExpenseController controller = Get.put(UpdateExpenseController());

  String? label;
  String expenseId = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.backgroundColor,
        title: const Text(
          'Update Expenes',
          style: TextStyle(
            fontWeight: FontWeight.w100,
            fontSize: 30,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: controller.formkey,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                // SingleChildScrollView(
                // child:
                Column(children: [
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // SizedBox(
                      // width: 160,
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
                            GetBuilder<UpdateExpenseController>(
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
                                      value: Constant.labelsList[index].label,
                                      child: Text(
                                          Constant.labelsList[index].label!),
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
                      Expanded(
                        flex: 1,
                        child: SizedBox(
                          width: 80,
                          child: Column(
                            children: [
                              const Text(
                                'Values',
                                style: TextStyle(fontSize: 20),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              CustomTextFormField(
                                  fieldType: TextInputType.number,
                                  textController: controller.valueController,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "enter value";
                                    }
                                    return null;
                                  },
                                  hintText: 'value',
                                  labelText: 'value'),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  CustomTextFormField(
                    hintText: "add descrtpiton",
                    labelText: 'add descrtpiton',
                    fieldType: TextInputType.text,
                    textController: controller.descrpionController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "enter descrpition";
                      }
                      return null;
                    },
                  ),

                  const SizedBox(
                    height: 30,
                  ),

                  GetBuilder<UpdateExpenseController>(
                    builder: (c) => ConditionalBuilder(
                      condition: controller.updatestate,
                      builder: (context) => Container(
                        // margin: const EdgeInsets.only(left: 8, right: 8),
                        child: CustomButton(
                          textButton: 'Update',
                          onPressed: () {
                            if (controller.formkey.currentState!.validate()) {
                              controller.updatExpense(
                                expenseId: expenseId,
                                label: controller.labelController.text,
                                value:
                                    int.parse(controller.valueController.text),
                                description:
                                    controller.descrpionController.text,
                              );
                            }
                          },
                        ),
                      ),
                      fallback: (context) =>
                          const Center(child: CircularProgressIndicator()),
                    ),
                  ),

                  const SizedBox(
                    height: 20,
                  ),
                  // list
                  // GetBuilder<UpdateExpenseController>(
                  //   builder: (c) => ConditionalBuilder(
                  //     condition: controller.deleteestate,
                  //     builder: (context) => CustomButton(
                  //       colorButton: Colors.red,
                  //       textButton: "Delete",
                  //       onPressed: () {
                  //         controller.deleteExpense(expenseId: expenseId);
                  //       },
                  //     ),
                  //     fallback: (context) =>
                  //         const Center(child: CircularProgressIndicator()),
                  //   ),
                  // ),
                  const SizedBox(
                    height: 300,
                  ),
                ]),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
