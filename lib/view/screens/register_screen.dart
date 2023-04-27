import 'package:flutter/material.dart';

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
          padding: const EdgeInsets.fromLTRB(10, 227, 10, 195),
          width: double.infinity,
          color: Color(0xffededed),
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
              CustomTextFormField(hintText: 'Name'),
              CustomTextFormField(hintText: 'E-mail'),
              SizedBox(
                width: double.infinity,
                height: 46,
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
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                width: double.infinity,
                height: 46,
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
                  margin: const EdgeInsets.only(top: 6, left: 134, right: 134),
                  child: CustomButton(textButton: 'Submit')),
              Container(
                margin: const EdgeInsets.fromLTRB(52, 0, 57, 0),
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
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          height: 1,
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
