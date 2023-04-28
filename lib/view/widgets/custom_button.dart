import 'package:flutter/material.dart';

import '../../constants/appcolor.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    super.key,
    required this.textButton,
    this.onPressed
  });
  VoidCallback? onPressed;
  String textButton;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
        ),
        child: Container(
          padding: const EdgeInsets.all(3),
          height: 32,
          decoration: BoxDecoration(
            border: Border.all(color: AppColor.borderColor),
            color: AppColor.buttonColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              '$textButton',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                height: 1,
                color: Color(0xffffffff),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
