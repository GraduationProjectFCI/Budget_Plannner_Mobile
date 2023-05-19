import 'package:budget_planner_app/constants/app_color.dart';
import 'package:budget_planner_app/constants/endpoint.dart';
import 'package:budget_planner_app/controller/deadline_controller.dart';
import 'package:budget_planner_app/controller/deadline_info_controller.dart';
import 'package:budget_planner_app/helper/cashe_helper.dart';
import 'package:budget_planner_app/helper/http_helper.dart';
import 'package:budget_planner_app/view/widgets/custom_button.dart';
import 'package:budget_planner_app/view/widgets/date_time.dart';
import 'package:budget_planner_app/view/widgets/toast.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/custom_textformfield.dart';

class DeadlineInfo extends StatelessWidget {
  UpdateDeadlineController controller = Get.put(UpdateDeadlineController());
  DeadlineInfo({
    super.key,
  });
  String deadlinId = Get.arguments;
  var formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppColor.backgroundColor,
        title: const Text(
          'Update',
          style: TextStyle(
            fontWeight: FontWeight.w100,
            fontSize: 30,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: formkey,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 50,
                ),
                picker(dateTimeController: controller.dateTimeController),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Deadline Name',
                            style: TextStyle(fontSize: 20),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                           CustomTextFormField(
                            hintText: "add deadline",
                            labelText: 'add deadline',
                                                   
                           
                            fieldType: TextInputType.text,
                            validator: (Value) {
                              if (Value!.isEmpty) {
                                return "please enter deadline name";
                              }
                              return null;
                            },
                            textController: controller.deadlineController,
                                                   ),
                        
                        ],
                      ),
                    ),
                    SizedBox(width: 20,),
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
                            hintText: "add value",
                            labelText: 'add value',
                            fieldType: TextInputType.number,
                            validator: (Value) {
                              if (Value!.isEmpty) {
                                return "please enter value";
                              }
                              return null;
                            },
                            textController: controller.valueController,
                          ),
                         
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 45,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 6),
                  child: GetBuilder<UpdateDeadlineController>(
                    builder: (c) => ConditionalBuilder(
                      condition: controller.state,
                      builder: (context) => CustomButton(
                        textButton: 'Update',
                        onPressed: () {
                          if (formkey.currentState!.validate()) {
                            controller
                                .updateData(
                                  deadlineId: deadlinId,
                                  date: controller.dateTimeController.text,
                                  name: controller.deadlineController.text,
                                  value: int.parse(
                                      controller.valueController.text),
                                )
                                .then((value) {});
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
                // CustomButton(
                //   colorButton: Colors.red,
                //   textButton: "Delete",
                //   onPressed: () {
                //     controller.deleteDeadline(deadlinId: deadlinId);
                //   },
                // ),
                const SizedBox(
                  height: 300,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
