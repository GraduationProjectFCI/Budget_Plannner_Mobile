import 'package:flutter/material.dart';

import '../../constants/appcolor.dart';
import '../../constants/constant.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_textformfield.dart';

class ConfirmScreen extends StatelessWidget {
  const ConfirmScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Container(
          padding: const EdgeInsets.fromLTRB(10 * Constant.aa,
              288 * Constant.aa, 10 * Constant.aa, 295 * Constant.aa),
          width: double.infinity,
          color: AppColor.backgroundColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(0 * Constant.aa,
                    0 * Constant.aa, 2 * Constant.aa, 14 * Constant.aa),
                child: const Text(
                  'Confirmation',
                  style: TextStyle(
                    fontSize: 42 * Constant.bb,
                    fontWeight: FontWeight.w700,
                    height: 1.115 * Constant.bb / Constant.aa,
                    color: Color(0xff000000),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0 * Constant.aa,
                    0 * Constant.aa, 8 * Constant.aa, 20 * Constant.aa),
                child: const Text(
                  'Enter the code that sent to your E-mail',
                  style: TextStyle(
                    fontSize: 13 * Constant.bb,
                    fontWeight: FontWeight.w700,
                    height: 1.115 * Constant.bb / Constant.aa,
                    color: Color(0xff000000),
                  ),
                ),
              ),
              CustomTextFormField(hintText: 'Enter Code'),
              Container(
                  margin: const EdgeInsets.only(
                      top: 6,
                      left: 134 * Constant.aa,
                      right: 134 * Constant.aa),
                  child: CustomButton(textButton: 'Submit')),
              Container(
                margin: const EdgeInsets.only(top: 6 * Constant.aa),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Resend Code ...? ',
                      style: TextStyle(
                        fontSize: 12 * Constant.bb,
                        fontWeight: FontWeight.w500,
                        height: 1.115 * Constant.bb / Constant.aa,
                        color: Color(0xff000000),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Click Here',
                        style: TextStyle(
                          fontSize: 12 * Constant.bb,
                          fontWeight: FontWeight.w700,
                          height: 1.115 * Constant.bb / Constant.aa,
                          color: Color(0xff1f61c4),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
