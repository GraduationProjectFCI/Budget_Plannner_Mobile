import 'package:budget_planner_app/controller/login_controller.dart';
import 'package:budget_planner_app/controller/login_controller.dart';
import 'package:budget_planner_app/controller/login_controller.dart';
import 'package:budget_planner_app/functions/valid_input.dart';
import 'package:budget_planner_app/helper/http_helper.dart';
import 'package:budget_planner_app/model/login_model.dart';
import 'package:budget_planner_app/view/screens/bottom_navigation_bar_screen.dart';
import 'package:budget_planner_app/view/widgets/toast.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/app_color.dart';
import '../../constants/app_routes.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_textformfield.dart';
import 'home_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    LoginController controller = Get.put(LoginController());
    return Scaffold(
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Container(
          padding: const EdgeInsets.fromLTRB(10, 263, 10, 269),
          width: double.infinity,
          color: AppColor.backgroundColor,
          child: Form(
            key: formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 1, 41),
                  child: const Text(
                    'Log-in',
                    style: TextStyle(
                      fontWeight: FontWeight.w100,
                      fontSize: 30,
                    ),
                  ),
                ),
                CustomTextFormField(
                  hintText: 'E-mail',
                  textController: emailController,
                  validator: (value) {
                    return validInput(value!, 5, 100, 'email');
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                GetBuilder<LoginController>(
                    builder: (c) => CustomTextFormField(
                          hintText: 'Enter Password',
                          ispassword: controller.isPassword,
                          suffix: IconButton(
                            onPressed: () {
                              controller.showPassword();
                            },
                            icon: Icon(controller.icon),
                          ),
                          textController: passwordController,
                          validator: (value) {
                            return validInput(value!, 5, 100, 'password');
                          },
                        )),
                Container(
                  margin: const EdgeInsets.only(top: 6, left: 134, right: 134),
                  child: GetBuilder<LoginController>(
                    builder: (c) => ConditionalBuilder(
                      condition: controller.state.isTrue,
                      builder: (context) => CustomButton(
                        textButton: 'Submit',
                        onPressed: () {
                          if (formkey.currentState!.validate()) {
                            controller.onSubmit(
                              email: emailController.text,
                              password: passwordController.text,
                            );
                          }
                        },
                      ),
                      fallback: (context) =>
                          const Center(child: CircularProgressIndicator()),
                    ),
                  ),
                ),
                Container(
                  // margin: const EdgeInsets.only(left: 53, right: 58),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: const NeverScrollableScrollPhysics(),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'If you don’t have an account please',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              height: 1,
                              color: Color(0xff000000)),
                        ),
                        TextButton(
                          // function
                          onPressed: () {
                            Get.offNamed(AppRoutes.register);
                          },

                          child: const Text(
                            'Register',
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



//    mohamedhassen011@gmail.com

//   123456Q@