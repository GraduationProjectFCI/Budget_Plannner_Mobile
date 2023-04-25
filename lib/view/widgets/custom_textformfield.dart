import 'package:flutter/material.dart';

import '../../constants/appcolor.dart';
import '../../constants/constant.dart';

class CustomTextFormField extends StatelessWidget {
  String hintText;
  CustomTextFormField({
    super.key,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // nameCQi (83:75)
      margin: const EdgeInsets.fromLTRB(
          0 * Constant.aa, 0 * Constant.aa, 0 * Constant.aa, 16 * Constant.aa),
      padding:
          const EdgeInsets.fromLTRB(10 * Constant.aa, 0, 10 * Constant.aa, 0),
      width: double.infinity,
      height: 30,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColor.hintTextColor,
        ),
        color: const Color(0xffffffff),
        borderRadius: BorderRadius.circular(10 * Constant.aa),
      ),
      child: TextFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: '$hintText',
          hintStyle: const TextStyle(
            fontWeight: FontWeight.w400,
            color: AppColor.hintTextColor,
          ),
        ),
        style: const TextStyle(
          fontSize: 15 * Constant.aa,
          fontWeight: FontWeight.w500,
          height: 1.115 * Constant.aa / Constant.aa,
          color: AppColor.hintTextColor,
        ),
      ),
    );
  }
}
