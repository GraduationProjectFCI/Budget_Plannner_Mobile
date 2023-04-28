import 'package:flutter/material.dart';

import '../../constants/appcolor.dart';

class CustomTextFormField extends StatelessWidget {
  String hintText;
  void Function(String)? onChange;
  TextEditingController? textController;
  CustomTextFormField(
      {super.key, required this.hintText, this.textController, this.onChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 16),
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColor.borderColor,
        ),
        color: const Color(0xffffffff),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        onChanged: onChange,
        controller: textController,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: '$hintText',
          hintStyle: const TextStyle(
            fontWeight: FontWeight.w400,
            color: AppColor.hintTextColor,
          ),
        ),
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500,
          height: 1,
          color: AppColor.hintTextColor,
        ),
      ),
    );
  }
}
