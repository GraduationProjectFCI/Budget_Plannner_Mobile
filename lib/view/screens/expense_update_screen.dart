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
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
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
                          const Text(
                            'Labels',
                            style: TextStyle(fontSize: 20),
                          ),
                          const SizedBox(
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
                                  child: Text(Constant.labelsList[index].label
                                      .toString()),
                                  value: Constant.labelsList[index].label,
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
                    const Spacer(),
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
                    return null;
                  },
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
                              value: int.parse(controller.valueController.text),
                              description: controller.descrpionController.text,
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
                  height: 30,
                ),
                // list
                GetBuilder<UpdateExpenseController>(
                  builder: (c) => ConditionalBuilder(
                    condition: controller.deleteestate,
                    builder: (context) => CustomButton(
                      textButton: "Delete",
                      onPressed: () {
                        controller.deleteExpense(expenseId: expenseId);
                      },
                    ),
                    fallback: (context) =>
                        const Center(child: CircularProgressIndicator()),
                  ),
                ),
              ]),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
