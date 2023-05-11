import 'package:budget_planner_app/controller/confirmation_controller.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/appcolor.dart';
import '../../constants/constant.dart';

import '../../functions/valid_input.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_textformfield.dart';

class ConfirmScreen extends StatelessWidget {
  ConfirmScreen({super.key});

  ConfirmationController controller = Get.put(ConfirmationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Container(
          padding: const EdgeInsets.fromLTRB(10, 280, 10, 295),
          width: double.infinity,
          color: AppColor.backgroundColor,
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 2, 14),
                  child: const Text(
                    'Confirmation',
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.w700,
                      height: 1,
                      color: Color(0xff000000),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 8, 20),
                  child: const Text(
                    'Enter the code that sent to your E-mail',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      height: 1,
                      color: Color(0xff000000),
                    ),
                  ),
                ),
                CustomTextFormField(
                  validator: (value) {
                    return validInput(value!, 6, 10, 'code');
                  },
                  fieldType: TextInputType.number,
                  hintText: 'Enter Code',
                  textController: controller.codeTextController,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 6, left: 134, right: 134),
                  child: GetBuilder<ConfirmationController>(
                    builder: (c) => ConditionalBuilder(
                      condition: controller.state.isTrue,
                      builder: (context) {
                        return CustomButton(
                          textButton: 'Submit',
                          onPressed: () async {
                            await controller.confirm();
                          },
                        );
                      },
                      fallback: (context) =>
                          const Center(child: CircularProgressIndicator()),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
