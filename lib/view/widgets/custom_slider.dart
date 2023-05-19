import 'package:budget_planner_app/constants/app_color.dart';
import 'package:budget_planner_app/controller/home_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSlider extends StatelessWidget {
  CustomSlider({super.key, required this.max, required this.value});
  int value;
  int max;

  @override
  Widget build(BuildContext context) {
    // HomeController homeController = Get.put(HomeController());
    return Slider(
      value: value.toDouble(),
      // value: _currentSliderValue,
      min: 0,
      max: max.toDouble(),
      label: value.toInt().toString(),
      activeColor: AppColor.buttonColor,
      inactiveColor: Colors.grey,
      onChanged: (double value) {
        // _currentSliderValue = value;
      },
    );
  }
}
