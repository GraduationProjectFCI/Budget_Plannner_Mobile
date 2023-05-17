import 'package:budget_planner_app/constants/app_color.dart';
import 'package:budget_planner_app/constants/app_routes.dart';
import 'package:budget_planner_app/controller/add_deadlin_controller.dart';
import 'package:budget_planner_app/controller/deadline_controller.dart';
import 'package:budget_planner_app/view/widgets/custom_button.dart';
import 'package:budget_planner_app/view/widgets/date_time.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddDeadlineScreen extends StatelessWidget {
  AddDeadlineScreen({super.key});
  AddDeadlineController controller = Get.put(AddDeadlineController());
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
          'Deadline',
          style: TextStyle(
            fontWeight: FontWeight.w100,
            fontSize: 30,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
              ),
              picker(dateTimeController: controller.dateTimeController),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 200,
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
                        TextFormField(
                          controller: controller.deadlineController,
                          validator: (Value) {
                            if (Value!.isEmpty) {
                              return "please enter deadline name";
                            }
                            return null;
                          },
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              fillColor: AppColor.hintTextColor),
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
                          controller: controller.valueController,
                          validator: (Value) {
                            if (Value!.isEmpty) {
                              return "please enter deadline name";
                            }
                            return null;
                          },
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              suffix: const Text('EGP'),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
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
              SizedBox(
                height: 30,
              ),
              Container(
                margin: const EdgeInsets.only(top: 6, left: 134, right: 134),
                child: GetBuilder<AddDeadlineController>(
                  builder: (c) => ConditionalBuilder(
                    condition: controller.state,
                    builder: (context) => CustomButton(
                      textButton: 'add',
                      onPressed: () {
                        if (formkey.currentState!.validate()) {
                          controller
                              .sendData(
                                date: controller.dateTimeController.text,
                                name: controller.deadlineController.text,
                                value:
                                    int.parse(controller.valueController.text),
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
            ],
          ),
        ),
      ),
    );
  }
}
