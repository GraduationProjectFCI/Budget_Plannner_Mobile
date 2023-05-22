import 'package:budget_planner_app/constants/app_color.dart';
import 'package:budget_planner_app/constants/app_routes.dart';
import 'package:budget_planner_app/constants/constant.dart';
import 'package:budget_planner_app/controller/home_controller.dart';
import 'package:budget_planner_app/controller/label_controller.dart';
import 'package:budget_planner_app/functions/valid_input.dart';
import 'package:budget_planner_app/helper/cashe_helper.dart';
import 'package:budget_planner_app/view/widgets/custom_button.dart';
import 'package:budget_planner_app/view/widgets/custom_textformfield.dart';
import 'package:budget_planner_app/view/widgets/toast.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LimitAdd extends StatelessWidget {
  LimitAdd({super.key});
  HomeController controller = Get.put(HomeController());
  String? label;

  late MediaQueryData queryData;
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
          'Add Limit',
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
          key: controller.formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 60,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        const Text(
                          'Add limit',
                          style: TextStyle(fontSize: 20),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        GetBuilder<HomeController>(
                          builder: (controller) => DropdownButton(
                            value: label,
                            onChanged: (value) {
                              controller.limitController.text =
                                  value.toString();
                              label = value;

                              // print(value);
                            },
                            items: [
                              ...List.generate(
                                Constant.labelsList.length,
                                (index) => DropdownMenuItem(
                                  value: Constant.labelsList[index].label,
                                  child:
                                      Text(Constant.labelsList[index].label!),
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
                  const SizedBox(
                    width: 20,
                  ),
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
                          hintText: "value",
                          labelText: 'value',
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
                height: 20,
              ),
              GetBuilder<HomeController>(
                builder: (co) => ConditionalBuilder(
                  condition: controller.addstate,
                  fallback: (context) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  builder: (context) => CustomButton(
                    textButton: 'Add',
                    onPressed: () async {
                      await controller.addLimit();
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
