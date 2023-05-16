import 'package:budget_planner_app/constants/app_color.dart';
import 'package:budget_planner_app/constants/constant.dart';

import 'package:budget_planner_app/view/widgets/custom_button.dart';
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: controller.formkey,
            child: ListView(
              children: [
                const SizedBox(
                  height: 30,
                ),
                // SingleChildScrollView(
                // child:
                Column(children: [
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 160,
                        child: Column(
                          children: [
                            Text(
                              'Labels',
                              style: TextStyle(fontSize: 20),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            DropdownButton(
                              isExpanded: true,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              dropdownColor: AppColor.buttonColor,
                              borderRadius: BorderRadius.circular(10),
                              iconSize: 50,
                              items: [
                                ...List.generate(
                                  Constant.labelsList.length,
                                  (index) => DropdownMenuItem(
                                    child: Text(Constant.labelsList[index]),
                                    value: Constant.labelsList[index],
                                  ),
                                ),
                              ],
                              onChanged: (value) {
                                controller.labelController.text =
                                    value.toString();
                                print(value);
                              },
                              hint: const Text('Select Label'),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      SizedBox(
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
                            TextFormField(
                              keyboardType: TextInputType.number,
                              controller: controller.valueController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "enter value";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                // suffix: const Text('EGP'),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                fillColor: AppColor.hintTextColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    controller: controller.descrpionController,
                    validator: (value) {
                                if (value!.isEmpty) {
                                  return "enter descrpition";
                                }
                                return null;},
                    decoration: InputDecoration(
                      // suffix: const Text('EGP'),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      hintText: "add descrtpiton",
                      fillColor: AppColor.hintTextColor,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    // margin: const EdgeInsets.only(left: 8, right: 8),
                    child: CustomButton(
                      textButton: 'Update',
                      onPressed: () {
                        controller.updatExpense(
                          expenseId: expenseId,
                          label: controller.labelController.text,
                          value: int.parse(controller.valueController.text),
                          description: controller.descrpionController.text,
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  // list

                  CustomButton(
                    textButton: "Delete",
                    onPressed: () {
                      controller.deleteExpense(expenseId: expenseId);
                    },
                  )
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
