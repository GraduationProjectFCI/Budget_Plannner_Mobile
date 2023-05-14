import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class BottomNavigationBarController extends GetxController {
  int navigatorValue = 0;

  late PageController pageController;

  void changeSelecteValue(int selectedValue) {
    navigatorValue = selectedValue;
    pageController.jumpToPage(selectedValue);
    update();
  }

  animateToPage(int selectedValue) {
    navigatorValue = selectedValue;
    pageController.animateToPage(selectedValue,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
    update();
  }

  @override
  void onInit() {
    pageController = PageController(initialPage: 0);
    
    update();
    super.onInit();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
