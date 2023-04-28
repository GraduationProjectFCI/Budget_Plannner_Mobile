import 'package:budget_planner_app/view/widgets/toast.dart';
import 'package:flutter/material.dart';

import '../../constants/appcolor.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_textformfield.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Container(
          padding: const EdgeInsets.fromLTRB(10, 263, 10, 269),
          width: double.infinity,
          color: AppColor.backgroundColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 1, 41),
                child: const Text(
                  'Log-in',
                  style: TextStyle(
                    fontSize: 46,
                    fontWeight: FontWeight.w700,
                    height: 1,
                    color: Color(0xff000000),
                  ),
                ),
              ),
              CustomTextFormField(hintText: 'E-mail'),
              CustomTextFormField(hintText: 'Enter Password'),
              Container(
                margin: const EdgeInsets.only(top: 6, left: 134, right: 134),
                child: CustomButton(
                  textButton: 'Submit',
                  onPressed: () {
                    toast();
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 53, right: 58),
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
                        onPressed: () {},

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
    );
  }
}
