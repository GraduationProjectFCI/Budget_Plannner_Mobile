import 'package:budget_planner_app/constants/app_color.dart';
import 'package:budget_planner_app/constants/app_routes.dart';
import 'package:budget_planner_app/constants/constant.dart';
import 'package:budget_planner_app/controller/home_controller.dart';
import 'package:budget_planner_app/controller/label_controller.dart';
import 'package:budget_planner_app/functions/valid_input.dart';
import 'package:budget_planner_app/helper/cashe_helper.dart';
import 'package:budget_planner_app/models/limits_model.dart';
import 'package:budget_planner_app/view/widgets/custom_button.dart';
import 'package:budget_planner_app/view/widgets/custom_textformfield.dart';
import 'package:budget_planner_app/view/widgets/toast.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditLimit extends StatelessWidget {
  EditLimit({super.key});
  HomeController controller = Get.put(HomeController());
  String? label;
  Limits limitId = Get.arguments;

  @override
  Widget build(BuildContext context) {
    CacheHelper.testSharedPreferences();
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppColor.backgroundColor,
        title: const Text(
          'Edit Limit',
          style: TextStyle(
            fontWeight: FontWeight.w100,
            fontSize: 30,
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20.0),
        child: Form(
          // key: controller.formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 60,
              ),
              Column(
                children: [
                  Text(
                    '${limitId.label}',
                    style: const TextStyle(
                        fontSize: 26, fontWeight: FontWeight.w300),
                  ),
                ],
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFormField(
                    hintText: "value",
                    labelText: 'value',
                    fieldType: TextInputType.number,
                    validator: (Value) {
                      if (Value!.isEmpty) {
                        return "please enter value";
                      }
                      return null;
                    },
                    textController: controller.limitUpdateController,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              GetBuilder<HomeController>(
                builder: (co) => ConditionalBuilder(
                  condition: controller.deleteState,
                  fallback: (context) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  builder: (context) => CustomButton(
                    textButton: 'Edit',
                    onPressed: () async {
                      await controller.deleteLimit(limitUrl: limitId.id);
                    },
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
