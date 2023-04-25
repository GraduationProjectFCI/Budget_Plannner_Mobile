import 'package:flutter/material.dart';

import '../../constants/appcolor.dart';
import '../../constants/constant.dart';
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
          padding: const EdgeInsets.fromLTRB(10 * Constant.aa,
              263 * Constant.aa, 10 * Constant.aa, 269 * Constant.aa),
          width: double.infinity,
          color: AppColor.backgroundColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(0 * Constant.aa,
                    0 * Constant.aa, 1 * Constant.aa, 41 * Constant.aa),
                child: const Text(
                  'Log-in',
                  style: TextStyle(
                    fontSize: 46 * Constant.bb,
                    fontWeight: FontWeight.w700,
                    height: 1.115 * Constant.bb / Constant.aa,
                    color: Color(0xff000000),
                  ),
                ),
              ),
              CustomTextFormField(hintText: 'E-mail'),
              CustomTextFormField(hintText: 'Enter Password'),
              Container(
                  margin: const EdgeInsets.only(
                      top: 6,
                      left: 134 * Constant.aa,
                      right: 134 * Constant.aa),
                  child: CustomButton(textButton: 'Submit')),
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
                            fontSize: 12 * Constant.bb,
                            fontWeight: FontWeight.w500,
                            height: 1.115 * Constant.bb / Constant.aa,
                            color: Color(0xff000000)),
                      ),
                      TextButton(
                        // function
                        onPressed: () {},

                        child: const Text(
                          'Register',
                          style: TextStyle(
                            fontSize: 12 * Constant.bb,
                            fontWeight: FontWeight.w700,
                            height: 1.115 * Constant.bb / Constant.aa,
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
