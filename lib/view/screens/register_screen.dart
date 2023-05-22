import 'package:budget_planner_app/constants/app_color.dart';
import 'package:budget_planner_app/controller/register_controller.dart';
import 'package:budget_planner_app/functions/valid_input.dart';
import 'package:budget_planner_app/view/widgets/date_time.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_textformfield.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  DateTime? selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    print(selectedDate);

    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      controller.refresh();
    }
    print('uijuiiji$selectedDate');

    controller.refresh();
  }

  RegisterController controller = Get.put(RegisterController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        // physics: const BouncingScrollPhysics(),
        child: Container(
          padding: const EdgeInsets.fromLTRB(15, 150, 15, 195),
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
                      fontWeight: FontWeight.w100,
                      fontSize: 30,
                    ),
                  ),
                ),
                CustomTextFormField(
                  prefixIcon: const Icon(Icons.person_outline),
                  labelText: 'Name',
                  hintText: 'Name',
                  fieldType: TextInputType.name,
                  textController: controller.nameTextController,
                  validator: (value) {
                    return validInput(value!, 5, 100, 'username');
                  },
                ),
                const SizedBox(height: 10),
                CustomTextFormField(
                    prefixIcon: const Icon(Icons.email_outlined),
                    labelText: 'E-mail',
                    validator: (value) {
                      return validInput(value!, 5, 100, 'email');
                    },
                    hintText: 'E-mail',
                    textController: controller.emailTextController),
                const SizedBox(height: 10),
                CustomTextFormField(
                    validator: (value) {
                      return validInput(value!, 5, 100, 'gender');
                    },
                    labelText: 'Gender',
                    hintText: 'Gender',
                    fieldType: TextInputType.text,
                    textController: controller.genderTextController),
                const SizedBox(height: 10),
                CustomTextFormField(
                    validator: (value) {
                      return validInput(value!, 5, 100, 'budget');
                    },
                    prefixIcon: const Icon(Icons.attach_money_outlined),
                    labelText: 'Budget',
                    hintText: 'Budget',
                    fieldType: TextInputType.number,
                    textController: controller.budgetAverageTextController),
                const SizedBox(height: 10),
                CustomTextFormField(
                    validator: (value) {
                      return validInput(value!, 5, 100, 'currency');
                    },
                    labelText: 'Currency',
                    hintText: 'currency',
                    textController: controller.currencyTextController),
                const SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  child: GetBuilder<RegisterController>(
                    builder: (c) => SizedBox(
                      // height: 55,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: CustomTextFormField(
                                prefixIcon:
                                    const Icon(Icons.lock_outline_rounded),
                                labelText: 'Password',
                                ispassword: controller.isPassword,
                                suffix: IconButton(
                                  onPressed: () {
                                    controller.showPassword();
                                  },
                                  icon: Icon(controller.icon),
                                ),
                                validator: (value) {
                                  return validInput(value!, 8, 100, 'password');
                                },
                                hintText: 'Password',
                                textController:
                                    controller.passwordTextController),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: CustomTextFormField(
                                prefixIcon:
                                    const Icon(Icons.lock_outline_rounded),
                                labelText: 'Passwoed',
                                ispassword: controller.isPassword,
                                suffix: IconButton(
                                  onPressed: () {
                                    controller.showPassword();
                                  },
                                  icon: Icon(controller.icon),
                                ),
                                validator: (value) {
                                  return validInput(value!, 8, 100, 'password');
                                },
                                hintText: 'Password',
                                textController:
                                    controller.rePasswordTextController),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                CustomTextFormField(
                    readOnly: true,
                    validator: (val) {
                      return validInput(val!, 6, 20, '');
                    },
                    labelText: 'birthdate',
                    prefixIcon: const Icon(Icons.calendar_today),
                    onTap: () {
                      controller.selectDate(context);
                    },
                    hintText: 'Select birthdate',
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
