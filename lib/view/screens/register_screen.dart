import 'package:budget_planner_app/constants/appcolor.dart';
import 'package:budget_planner_app/controller/register_controller.dart';
import 'package:budget_planner_app/functions/valid_input.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_textformfield.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  RegisterController controller = Get.put(RegisterController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.fromLTRB(10, 150, 10, 195),
          width: double.infinity,
          color: AppColor.backgroundColor,
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 1, 17),
                  child: const Text(
                    'Register',
                    style: TextStyle(
                      fontSize: 46,
                      fontWeight: FontWeight.w700,
                      height: 1,
                      color: Color(0xff000000),
                    ),
                  ),
                ),
                CustomTextFormField(
                  hintText: 'Name',
                  fieldType: TextInputType.name,
                  textController: controller.nameTextController,
                ),
                const SizedBox(height: 10),
                CustomTextFormField(
                    validator: (value) {
                      return validInput(value!, 5, 100, 'email');
                    },
                    hintText: 'E-mail',
                    textController: controller.emailTextController),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: CustomTextFormField(
                            hintText: 'Gender',
                            fieldType: TextInputType.text,
                            textController: controller.genderTextController),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: CustomTextFormField(
                            fieldType: TextInputType.number,
                            hintText: 'Age',
                            textController: controller.ageTextController),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                CustomTextFormField(
                    hintText: 'Monthly Budget Average',
                    fieldType: TextInputType.number,
                    textController: controller.budgetAverageTextController),
                const SizedBox(height: 10),
                CustomTextFormField(
                    hintText: 'Preferred currency',
                    textController: controller.currencyTextController),
                const SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: CustomTextFormField(
                            validator: (value) {
                              return validInput(value!, 8, 100, 'password');
                            },
                            hintText: 'Enter Passwoed',
                            textController: controller.passwordTextController),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: CustomTextFormField(
                            validator: (value) {
                              return validInput(value!, 8, 100, 'password');
                            },
                            hintText: 'Re-enter Password',
                            textController:
                                controller.rePasswordTextController),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                CustomTextFormField(
                    hintText: 'birthdate',
                    textController: controller.birthdateTextController),
                Container(
                  margin: const EdgeInsets.only(top: 6, left: 134, right: 134),
                  child: GetBuilder<RegisterController>(
                    builder: (c) => ConditionalBuilder(
                      condition: controller.state.isTrue,
                      builder: (context) {
                        return CustomButton(
                          textButton: 'Submit',
                          onPressed: () async {
                            var res2 = await controller.signUp();

                            // print('\nfrom screen-------  $res2');
                          },
                        );
                      },
                      fallback: (context) =>
                          const Center(child: CircularProgressIndicator()),
                    ),
                  ),
                ),
                Container(
                  // margin: const EdgeInsets.fromLTRB(52, 0, 57, 0),
                  // width: double.infinity,

                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: const NeverScrollableScrollPhysics(),
                    child: Row(
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'If you already have an account please',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            height: 1,
                            color: Color(0xff000000),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            controller.goToLogin();
                          },
                          child: const Text(
                            'log-in',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              height: 1,
                              color: Color(0xff3356d2),
                            ),
                          ),
                        ),
                      ],
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
