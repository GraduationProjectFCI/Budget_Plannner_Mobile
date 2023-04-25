import 'package:flutter/material.dart';

import '../../constants/constant.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_textformfield.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Container(
          padding: const EdgeInsets.fromLTRB(10 * Constant.aa,
              227 * Constant.aa, 10 * Constant.aa, 195 * Constant.aa),
          width: double.infinity,
          color: Color(0xffededed),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(0 * Constant.aa,
                    0 * Constant.aa, 1 * Constant.aa, 17 * Constant.aa),
                child: const Text(
                  'Register',
                  style: TextStyle(
                    fontSize: 46 * Constant.bb,
                    fontWeight: FontWeight.w700,
                    height: 1.115 * Constant.bb / Constant.aa,
                    color: Color(0xff000000),
                  ),
                ),
              ),
              CustomTextFormField(hintText: 'Name'),
              CustomTextFormField(hintText: 'E-mail'),
              SizedBox(
                width: double.infinity,
                height: 46 * Constant.aa,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(child: CustomTextFormField(hintText: 'Gender')),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(child: CustomTextFormField(hintText: 'Age')),
                  ],
                ),
              ),
              CustomTextFormField(hintText: 'Monthly Budget Average'),
              CustomTextFormField(hintText: 'Preferred currency'),
              Container(
                margin: const EdgeInsets.fromLTRB(0 * Constant.aa,
                    0 * Constant.aa, 0 * Constant.aa, 8 * Constant.aa),
                width: double.infinity,
                height: 46 * Constant.aa,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                        child: CustomTextFormField(hintText: 'Enter Passwoed')),
                    const SizedBox(width: 8),
                    Expanded(
                        child:
                            CustomTextFormField(hintText: 'Re-enter Password')),
                  ],
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(
                      top: 6,
                      left: 134 * Constant.aa,
                      right: 134 * Constant.aa),
                  child: CustomButton(textButton: 'Submit')),
              Container(
                margin: const EdgeInsets.fromLTRB(52 * Constant.aa,
                    0 * Constant.aa, 57 * Constant.aa, 0 * Constant.aa),
                width: double.infinity,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: const NeverScrollableScrollPhysics(),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'If you already have an account please',
                        style: TextStyle(
                          fontSize: 12 * Constant.bb,
                          fontWeight: FontWeight.w500,
                          height: 1.115 * Constant.bb / Constant.aa,
                          color: Color(0xff000000),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                        ),
                        child: const Text(
                          'log-in',
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
