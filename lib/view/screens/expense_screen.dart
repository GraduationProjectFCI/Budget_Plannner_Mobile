import 'package:budget_planner_app/constants/appcolor.dart';
import 'package:budget_planner_app/constants/approutes.dart';
import 'package:budget_planner_app/controller/add_sheet_controller.dart';
import 'package:budget_planner_app/view/widgets/custom_button.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/expense_controller.dart';

class ExportScreen extends StatelessWidget {
  ExportScreen({super.key});
  ExpenseController controller = Get.put(ExpenseController());
  TextEditingController valueController = TextEditingController();
  TextEditingController labelController = TextEditingController();
  var formkey = GlobalKey<FormState>();
  String? label;
  List<String> sheetInfo = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: formkey,
            child: Column(
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${sheetInfo[0]}',
                        style: const TextStyle(
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
                              textButton: 'add',
                              onPressed: () {
                                if (formkey.currentState!.validate()) {
                                  controller
                                      .sendData(
                                    sheetId: sheetInfo[1],
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
                Expanded(
                  child: SizedBox(
                    child: ListView(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 140,
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
                                    value: " label",
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    dropdownColor: AppColor.buttonColor,
                                    borderRadius: BorderRadius.circular(10),
                                    iconSize: 50,
                                    items: const [
                                      DropdownMenuItem(
                                        child: Text('food'),
                                        value: 'food',
                                      ),
                                      DropdownMenuItem(
                                        child: Text('drink'),
                                        value: 'drink',
                                      ),
                                      DropdownMenuItem(
                                        child: Text('transport'),
                                        value: 'transport',
                                      ),
                                      DropdownMenuItem(
                                        child: Text('wifi'),
                                        value: 'wifi',
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
                            SizedBox(
                              width: 100,
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
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        fillColor: AppColor.hintTextColor),
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
                                      sheetId: sheetInfo[1],
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
                              fallback: (context) => const Center(
                                  child: CircularProgressIndicator()),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          padding: const EdgeInsets.all(15),
                          color: AppColor.hintTextColor,
                          height: 400,
                          child: ListView.separated(
                            separatorBuilder: (context, index) => Divider(),
                            itemCount: 33,
                            itemBuilder: (context, index) {
                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text(
                                    'Food',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '555 EGP',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 80,
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
                      ],
                    ),
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
