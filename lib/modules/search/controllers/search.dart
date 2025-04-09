import 'package:get/get.dart';

class SearchingController extends GetxController {
  var currentIndex = 1.obs; // Set to 1 since this is the Search tab
  var isLoading = false.obs;
  var reviews = [].obs;

  void changeTab(int index) {
    currentIndex.value = index;
  }
}