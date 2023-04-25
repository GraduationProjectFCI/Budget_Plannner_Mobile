import 'package:flutter/material.dart';

import '../../constants/appcolor.dart';
import '../../constants/constant.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    super.key,
    required this.textButton,
  });
  String textButton;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
        ),
        child: Container(
          padding: EdgeInsets.all(3),
          height: 32 * Constant.aa,
          decoration: BoxDecoration(
            border: Border.all(color: AppColor.borderColor),
            color: const Color(0xff57c4b2),
            borderRadius: BorderRadius.circular(10 * Constant.aa),
          ),
          child: Center(
            child: Text(
              '$textButton',
              style: const TextStyle(
                fontSize: 16 * Constant.bb,
                fontWeight: FontWeight.w700,
                height: 1.115 * Constant.bb / Constant.aa,
                color: Color(0xffffffff),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
