import 'package:get/get.dart';

class NavigationController extends GetxController {
   final tabIndex = 0.obs;

  changeTabIndex(int tab) {
    tabIndex.value = tab;
  }
}