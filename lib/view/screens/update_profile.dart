import 'package:budget_planner_app/constants/app_color.dart';
import 'package:budget_planner_app/controller/register_controller.dart';
import 'package:budget_planner_app/functions/valid_input.dart';
import 'package:budget_planner_app/view/widgets/date_time.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/update_profile_controller.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_textformfield.dart';

class UpdateProfileScreen extends StatelessWidget {
  UpdateProfileScreen({super.key});
  UpdateProfileController controller = Get.put(UpdateProfileController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColor.backgroundColor,
        title: const Text(
          'Update Profile',
          style: TextStyle(
            fontWeight: FontWeight.w100,
            fontSize: 30,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          padding: const EdgeInsets.all(20.0),
          width: double.infinity,
          color: AppColor.backgroundColor,
          child: Form(
            key: controller.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 50,
                ),
                CustomTextFormField(
                  prefixIcon: const Icon(Icons.person_outline),
                  labelText: 'Name',
                  hintText: 'Enter Your Name',
                  fieldType: TextInputType.name,
                  textController: controller.nameTextController,
                ),
                const SizedBox(height: 20),
                CustomTextFormField(
                    validator: (value) {
                      return validInput(value!, 5, 100, 'email');
                    },
                    prefixIcon: const Icon(Icons.email_outlined),
                    labelText: 'E-mail',
                    hintText: 'Enter Your  E-mail',
                    textController: controller.emailTextController),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: CustomTextFormField(
                            labelText: 'Gender',
                            hintText: 'Enter Your Gender',
                            fieldType: TextInputType.text,
                            textController: controller.genderTextController),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: CustomTextFormField(
                            labelText: 'Age',
                            fieldType: TextInputType.number,
                            hintText: 'Enter Your Age',
                            textController: controller.ageTextController),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                CustomTextFormField(
                    prefixIcon: const Icon(Icons.attach_money_outlined),
                    labelText: 'Budget',
                    hintText: 'Enter Monthly Budget Average',
                    fieldType: TextInputType.number,
                    textController: controller.budgetAverageTextController),
                const SizedBox(height: 20),
                CustomTextFormField(
                    labelText: 'Currency',
                    hintText: 'Enter Preferred currency',
                    textController: controller.currencyTextController),
                const SizedBox(height: 20),
                // Container(
                //   width: double.infinity,
                //   child: Row(
                //     crossAxisAlignment: CrossAxisAlignment.center,
                //     children: [
                //       Expanded(
                //         child: CustomTextFormField(
                //             validator: (value) {
                //               return validInput(value!, 8, 100, 'password');
                //             },
                //             hintText: 'Enter Passwoed',
                //             textController: controller.passwordTextController),
                //       ),
                //       const SizedBox(width: 8),
                //       Expanded(
                //         child: CustomTextFormField(
                //             validator: (value) {
                //               return validInput(value!, 8, 100, 'password');
                //             },
                //             hintText: 'Re-enter Password',
                //             textController:
                //                 controller.rePasswordTextController),
                //       ),
                //     ],
                //   ),
                // ),
                // const SizedBox(height: 10),
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
                const SizedBox(height: 25),
                // picker(dateTimeController: controller.birthdateTextController),
                Container(
                  margin: const EdgeInsets.only(top: 6, left: 134, right: 134),
                  child: GetBuilder<UpdateProfileController>(
                    builder: (c) => ConditionalBuilder(
                      condition: controller.state.isTrue,
                      builder: (context) {
                        return CustomButton(
                          textButton: 'Update',
                          onPressed: () async {
                            var res2 = await controller.updateprofile();
                          },
                        );
                      },
                      fallback: (context) =>
                          const Center(child: CircularProgressIndicator()),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 150,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
