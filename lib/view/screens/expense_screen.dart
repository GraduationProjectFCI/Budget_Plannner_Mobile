import 'package:budget_planner_app/constants/app_color.dart';
import 'package:budget_planner_app/constants/app_routes.dart';
import 'package:budget_planner_app/controller/add_sheet_controller.dart';
import 'package:budget_planner_app/view/widgets/custom_button.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/expense_controller.dart';
import '../widgets/custom_list_expenses.dart';

class ExportScreen extends StatelessWidget {
  ExportScreen({super.key});
  ExpenseController controller = Get.put(ExpenseController());
  TextEditingController valueController = TextEditingController();
  TextEditingController labelController = TextEditingController();
  var formkey = GlobalKey<FormState>();
  String? label;
  // List<String> sheetInfo = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: formkey,
            child: ListView(
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'import',
                        style: TextStyle(
                          fontWeight: FontWeight.w100,
                          fontSize: 30,
                        ),
                      ),
                      const Spacer(),
                      Container(
                        margin: const EdgeInsets.only(left: 8, right: 8),
                        child: GetBuilder<ExpenseController>(
                          builder: (c) => ConditionalBuilder(
                            condition: controller.state.isTrue,
                            builder: (context) => CustomButton(
                              paddingLeft: 10,
                              paddingRight: 14,
                              paddingTop: 5,
                              paddingButtom: 5,
                              textButton: 'Add',
                              onPressed: () {
                                if (formkey.currentState!.validate()) {
                                  controller
                                      .sendData(
                                    sheetId: 'sheetInfo[1]',
                                    label: labelController.text,
                                    // description: ,
                                    values: int.parse(valueController.text),
                                  )
                                      .then((value) {
                                    valueController.clear();
                                    labelController.clear();
                                  });
                                }
                              },
                            ),
                            fallback: (context) => const Center(
                                child: CircularProgressIndicator()),
                          ),
                        ),
                      ),
                    ]),
                const SizedBox(
                  height: 30,
                ),
                // SingleChildScrollView(
                // child:
                Column(
                  children: [
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
                                    5,
                                    (index) => DropdownMenuItem(
                                      child: Text('food'),
                                      value: 'food',
                                    ),
                                  ),
                                ],
                                onChanged: (value) {
                                  labelController.text = value.toString();
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
                                controller: valueController,
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
                      height: 15,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 8, right: 8),
                      child: GetBuilder<ExpenseController>(
                        builder: (c) => ConditionalBuilder(
                          condition: controller.state.isTrue,
                          builder: (context) => CustomButton(
                            textButton: 'add',
                            onPressed: () {
                              if (formkey.currentState!.validate()) {
                                controller
                                    .sendData(
                                  sheetId: 'sheetInfo[1]',
                                  label: labelController.text,
                                  // description: ,
                                  values: int.parse(valueController.text),
                                )
                                    .then((value) {
                                  //TODO
                                  // will add element to list
                                });
                              }
                            },
                          ),
                          fallback: (context) =>
                              const Center(child: CircularProgressIndicator()),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    // list
                    BuildCustomListExpenses(
                        //model
                        ),

                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: AppColor.hintTextColor,
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
                          child: Text(
                            '${controller.total} EGP',
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 50,
                    ),
                  ],
                ),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
