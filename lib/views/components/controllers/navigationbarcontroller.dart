import 'package:flutter/material.dart';
import 'package:get/get.dart';

class navigationbar_c extends GetxController {
  RxInt selectedIndex = 1.obs;
  PageController pageController = PageController();

  whencheng({required int val}) {
    selectedIndex.value = val;
    pageController.animateToPage(val,
        duration: Duration(microseconds: 400), curve: Curves.bounceIn);
  }
}
