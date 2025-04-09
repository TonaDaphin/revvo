import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppController extends GetxController {
  var currentIndex = 0.obs; // Start at Home tab (index 0)

  // Routes for each tab
  static const String homeRoute = '/home';
  static const String searchRoute = '/search';
  static const String postRoute = '/review';
  static const String ordersRoute = '/reviews';
  static const String profileRoute = '/profile';

  void changeTab(int index) {
    currentIndex.value = index;
    switch (index) {
      case 0:
        Get.offAllNamed(homeRoute); // Navigate to Home
        break;
      case 1:
        Get.offAllNamed(searchRoute); // Navigate to Search
        break;
      case 2:
        Get.offAllNamed(postRoute); // Navigate to Post
        break;
      case 3:
        Get.offAllNamed(ordersRoute); // Navigate to Orders
        break;
      case 4:
        Get.offAllNamed(profileRoute); // Navigate to Profile
        break;
    }
  }
}