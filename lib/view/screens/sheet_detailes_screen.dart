import 'package:budget_planner_app/constants/app_color.dart';
import 'package:budget_planner_app/constants/constant.dart';
import 'package:budget_planner_app/view/screens/sheet_info.dart';
// import 'package:budget_planner_app/view/screens/deadlines_screen.dart';

import 'package:budget_planner_app/view/widgets/custom_button.dart';
import 'package:budget_planner_app/view/widgets/custom_textformfield.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:budget_planner_app/controller/sheet_info_controller.dart';

import '../../controller/expense_controller.dart';
import '../../helper/cashe_helper.dart';
import '../widgets/custom_list_expenses.dart';

class SheetDetials extends StatelessWidget {
  SheetDetials({super.key});
  sheetInfoController controller = Get.put(sheetInfoController());

  String? label;
  String sheetId = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColor.backgroundColor,
        title: const Text(
          "Sheet detailes",
          style: TextStyle(
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
                          //   width: 160,
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
                                GetBuilder<sheetInfoController>(
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
                          // const Spacer(),
                          // SizedBox(
                          // width: 80,
                          // child:
                          Expanded(
                            flex: 1,
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
                                  hintText: 'value',
                                  labelText: 'value',
                                  fieldType: TextInputType.number,
                                  textController: controller.valueController,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "enter value";
                                    }
                                    return null;
                                  },
                                ),
                              ],
                            ),
                          ),
                          // ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      CustomTextFormField(
                        hintText: "add descrtpiton",
                        labelText: 'add descrtpiton',
                        fieldType: TextInputType.text,
                        textController: controller.descrController,
                      ),

                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 8, right: 8),
                        child: GetBuilder<sheetInfoController>(
                          builder: (c) => ConditionalBuilder(
                            condition: controller.addstate,
                            builder: (context) => CustomButton(
                              textButton: 'add',
                              onPressed: () {
                                controller.addLabel();
                                // controller.addData();
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
                      Container(
                        height: 380,
                        child: SizedBox(
                          height: double.infinity,
                          child: GetBuilder<sheetInfoController>(builder: (c) {
                            return ConditionalBuilder(
                              condition: controller.state,
                              fallback: (context) => const Center(
                                child: CircularProgressIndicator(),
                              ),
                              builder: (context) {
                                print(
                                    "!!!!!!!!!!!! ${controller.model.expenses}");
                                return Container(
                                  height: 380,
                                  child: ListView.separated(
                                    physics: const BouncingScrollPhysics(),
                                    separatorBuilder: (context, index) =>
                                        const Divider(
                                      height: 5,
                                      thickness: 1,
                                    ),
                                    itemCount:
                                        controller.model.expenses!.length,
                                    itemBuilder: (context, index) {
                                      return CustomContainer(
                                        index: index,
                                        date: controller
                                            .model.expenses![index].label,
                                        sheetId: controller
                                            .model.expenses![index].labelId,
                                        money:
                                            '${controller.model.expenses![index].value}',
                                      );
                                    },
                                  ),
                                );
                              },
                            );
                          }),
                        ),
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
